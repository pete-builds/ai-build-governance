#!/usr/bin/env perl
# Generates contents.md, reference/requirement-index.md, reference/requirements.json,
# and the canonical spine block inside index.md, README.md and model/index.md.
#
#   perl tools/build-nav.pl           write the files
#   perl tools/build-nav.pl --check   exit non-zero if the committed files are stale
#
# These are generated for the reason requirement 7.9 gives: anything that can be
# generated should be, because generated content cannot drift out of step with
# what it describes. Editing them by hand will be reverted by the next run and
# will fail the check in tools/check.sh.
#
# The spine block is generated for a more specific reason. It was stated in four
# places in four different shapes, two of which had already drifted into
# miscounting the standing arrangements. There is no Jekyll include mechanism
# here, and README.md is rendered by github.com where Liquid tags would not run,
# so the only mechanism that cannot drift is generating the block into each file
# between markers and failing the build when a copy diverges.

use strict;
use warnings;

my $check = (@ARGV && $ARGV[0] eq '--check');

# ---------------------------------------------------------------------------
# The spine. This is the single source of truth for the model's shape.
#
# Seven steps over six chapters: chapter 07 supplies two of them, because it
# states two failures. Approving production and being able to say afterwards
# what is running are different acts that fail in different ways.

my @SPINE = (
  ['Establish the need',           '02-statement-of-need.md',      'Statement of Need',                 'Building the wrong thing, solution-first'],
  ['Classify the consequences',    '03-classification.md',         'Risk Classification',               'Risk decided by reviewer mood'],
  ['Review the design',            '04-design-review.md',          'Design Review',                     'A design nobody read against the requirement'],
  ['Authorize construction',       '05-authorization-to-build.md', 'Authorization to Build',            'Approval becoming a permanent entitlement'],
  ['Inspect at the right moments', '06-inspections.md',            'Inspections',                       'Verification after the evidence is gone'],
  ['Approve production',           '07-production-approval.md',    'Production Approval and Records',   'Software arriving in production by being used more, with nobody having decided'],
  ['Keep a record',                '07-production-approval.md',    'Production Approval and Records',   'Nobody being able to say what is running, what it can reach, and who owns it'],
);

# Chapter 08 is not step eight. It is the way back in.
my $REENTRY = ['08-alterations.md', 'Alterations and Existing Systems', 'Change that silently outruns its review'];

# Six of them. Counting these as steps 8 through 13 is most of why the model
# reads heavier than it is.
my @STANDING = (
  ['01-principles.md',           'Principles',                     'Always. Where a chapter conflicts with a principle, the principle wins.'],
  ['09-roles.md',                'Roles and Authority',            'From before the Statement of Need until decommissioning'],
  ['10-concurrent-reviews.md',   'Concurrent Reviews',             'Alongside design review, never as a queue behind it'],
  ['11-certified-components.md', 'Certified Reusable Components',  'Both the **entry point** for anything reusing existing work and an output of finishing'],
  ['12-delegated-authority.md',  'Delegated Authority',            "Whenever an agent acts on a human's behalf"],
  ['13-third-party.md',          'Third-Party Capabilities',       'Whenever a build depends on something the institution does not operate'],
);

my $SPINE_SENTENCE =
  'Establish the need, classify the consequences, review the design, authorize '
. 'construction, inspect at the right moments, approve production, and keep a record.';

# $prefix is the relative path to model/ from the file being written into.
sub spine_block {
  my $prefix = shift;
  my $b = '';
  $b .= "**The model is one sentence.** $SPINE_SENTENCE\n\n";
  $b .= "Everything else in it hangs off that sentence.\n\n";
  $b .= "| | Step | Chapter | The failure it prevents |\n|--:|:--|:--|:--|\n";
  my $i = 0;
  for my $s (@SPINE) {
    $i++;
    $b .= sprintf "| %d | %s | [%s](%s%s) | %s |\n", $i, $s->[0], $s->[2], $prefix, $s->[1], $s->[3];
  }
  $b .= sprintf "| ↺ | **When it changes, re-enter** | [%s](%s%s) | %s |\n",
                $REENTRY->[1], $prefix, $REENTRY->[0], $REENTRY->[2];
  $b .= "\n**Six chapters are not steps.** They are standing arrangements, true the\n"
      . "whole way through:\n\n";
  $b .= "| Chapter | Applies |\n|:--|:--|\n";
  for my $s (@STANDING) {
    $b .= sprintf "| [%s](%s%s) | %s |\n", $s->[1], $prefix, $s->[0], $s->[2];
  }
  $b .= "\n**Start at [Certified Reusable Components](${prefix}11-certified-components.md), not at step 1.**\n"
      . "A capability consuming an already certified component inherits its inspection\n"
      . "and reviews only the integration. That is the fastest path through all of this,\n"
      . "and the only one that gets faster as an institution governs more.\n";
  return $b;
}

# Splice a generated block into a hand-written file between markers.
sub splice_block {
  my ($file, $name, $block) = @_;
  open my $h, '<', $file or die "$file: $!";
  local $/; my $text = <$h>; close $h;
  my $begin = "<!-- $name:BEGIN generated by tools/build-nav.pl; edit the data there, not here -->";
  my $end   = "<!-- $name:END -->";
  my $want  = "$begin\n\n$block\n$end";
  unless ($text =~ s/\Q$begin\E.*?\Q$end\E/$want/s) {
    die "$file: no $name markers found. Add:\n$begin\n$end\n";
  }
  return $text;
}

# ---------------------------------------------------------------------------
# helpers

sub slug {                      # kramdown-compatible heading anchor
  my $s = lc shift;
  $s =~ s/[^a-z0-9 -]//g;
  $s =~ s/ +/-/g;
  return $s;
}

sub title_of {                  # front-matter title
  my $f = shift; open my $h,'<',$f or return $f;
  while (my $l = <$h>) { if ($l =~ /^title:\s*"?(.*?)"?\s*$/) { close $h; return $1 } }
  close $h; return $f;
}

sub chapter_num { my $f = shift; $f =~ m{/(\d+)-} ? $1 : '' }

# Parse a model chapter: H3 subsections in order, and every requirement with
# the subsection it sits under.
sub parse_chapter {
  my $f = shift;
  open my $h,'<',$f or die "$f: $!";
  my (@subs, @reqs); my $cur = '';
  my ($pending, @body);
  my $flush = sub {
    return unless defined $pending;
    my $raw = join ' ', @body;
    # Normative strength, before the bold markers are stripped. A requirement
    # routinely carries several, so this is the set present, not one label.
    my %kw; $kw{$1}++ while $raw =~ /\*\*(MUST NOT|MUST|SHOULD NOT|SHOULD|MAY)\*\*/g;
    my @order = grep { $kw{$_} } ('MUST NOT','MUST','SHOULD NOT','SHOULD','MAY');
    my $sum = $raw;
    $sum =~ s/\*\*//g; $sum =~ s/^\s+|\s+$//g;
    $sum =~ s/\s+/ /g;
    $sum =~ s/^([^.]{0,110}?[.])\s.*$/$1/;      # first sentence if short enough
    if (length $sum > 116) { $sum = substr($sum,0,113); $sum =~ s/\s+\S*$//; $sum .= '...' }
    push @reqs, { num => $pending->[0], name => $pending->[1], sub => $pending->[2],
                  summary => $sum, keywords => \@order };
    undef $pending; @body = ();
  };
  while (my $l = <$h>) {
    if ($l =~ /^### (.+?)\s*$/)               { $flush->(); $cur = $1; push @subs, $1; next }
    if ($l =~ /^## (.+?)\s*$/)                { $flush->(); next }
    if ($l =~ /^> \*\*REQUIREMENT ([\d.]+?)(?:\s+(.*?))?\*\*\s*$/) {
      $flush->(); $pending = [$1, (defined $2 ? $2 : ''), $cur]; next;
    }
    if (defined $pending) {
      if ($l =~ /^>\s?(.*)$/) { my $t=$1; push @body,$t if $t =~ /\S/ && $t !~ /^\|/ }
      else { $flush->() }
    }
  }
  $flush->();
  close $h;
  return (\@subs, \@reqs);
}

sub h2s { my $f=shift; open my $h,'<',$f or return []; my @o;
          while (my $l=<$h>) { push @o,$1 if $l =~ /^## (.+?)\s*$/ } close $h; return \@o }

# ---------------------------------------------------------------------------
# gather

my @model     = sort glob 'model/0[0-9]*.md model/1[0-9]*.md';
my @guide     = sort glob 'guide/0[0-9]*.md';
my @appendix  = sort { title_of($a) cmp title_of($b) } glob 'reference/*.md';
@appendix     = grep { $_ !~ m{/index\.md$} && $_ !~ m{requirement-index} } @appendix;
my @profiles  = sort glob 'reference/platform-profiles/*.md';
my @templates = sort glob 'templates/*.md';
@templates    = grep { $_ !~ m{/index\.md$} } @templates;

# ---------------------------------------------------------------------------
# contents.md

my $c = <<"HEAD";
---
title: Contents
nav_order: 4
---

# Contents

Every page in the framework, grouped by layer. Generated from the source files by
`tools/build-nav.pl`, so it cannot fall out of step with what it describes.

**New to this?** Read the [executive summary](overview.md).
**Want the whole model condensed?** Use the [quick reference](quick-ref.md).
**Looking for a specific requirement by number?** Use the
[requirement index](reference/requirement-index.md).

| Layer | Pages | Binds? |
|:--|--:|:--|
| [Core Governance Model](model/) | @{[scalar @model]} | **Yes**, once adopted |
| [Implementation Guide](guide/) | @{[scalar @guide]} | No |
| [Technical and Evidence References](reference/) | @{[scalar @appendix + scalar @profiles]} | No |
| [Templates](templates/) | @{[scalar @templates]} | The completed artifact is the evidence |

**You do not need to read all of it.** The model is the only layer that binds,
and reading only Purpose and Requirement across it is a deliberate and
supported way through. See
[how to read this](model/00-conventions.md).

---

## Core Governance Model

Thirteen normative chapters, plus the conventions page. Every chapter carries
the same eight sections: Purpose, Failure this prevents, Requirement,
Applicability, Required evidence, Exceptions, Implementation guidance, Sources
and confidence. Listed below are the requirement groupings inside each, which
is the part that differs between them.

HEAD

for my $f (@model) {
  my ($subs, $reqs) = parse_chapter($f);
  my $t = title_of($f);
  $c .= sprintf "### [%s](%s)\n\n", $t, $f;
  if (@$reqs) {
    my %by; push @{$by{$_->{sub}}}, $_->{num} for @$reqs;
    if (@$subs) {
      for my $s (@$subs) {
        next unless $by{$s};
        my @n = @{$by{$s}};
        $c .= sprintf "- **%s** (%s)\n", $s, (@n > 1 ? "$n[0] to $n[-1]" : $n[0]);
      }
      if (my $loose = $by{''}) { $c .= sprintf "- Opening requirement (%s)\n", join ', ', @$loose }
    } else {
      $c .= sprintf "- %d requirements: %s\n", scalar @$reqs, join ', ', map { $_->{num} } @$reqs;
    }
  } else {
    $c .= "- No numbered requirements. Conventions and reading guidance.\n";
  }
  $c .= "\n";
}

$c .= "---\n\n## Implementation Guide\n\nNon-binding. The numbering is not a reading order; see the\n[audience table](guide/).\n\n";
for my $f (@guide) {
  $c .= sprintf "### [%s](%s)\n\n", title_of($f), $f;
  $c .= sprintf "- %s\n", join "\n- ", @{h2s($f)} if @{h2s($f)};
  $c .= "\n";
}

$c .= "---\n\n## Technical and Evidence References\n\nNon-binding and the most volatile layer. Check retrieval dates in the\n[source ledger](SOURCES.md) before relying on anything here.\n\n";
$c .= sprintf "- [%s](%s)\n", title_of($_), $_ for @appendix;
$c .= sprintf "- [Requirement index](reference/requirement-index.md), every numbered requirement\n";
$c .= sprintf "- `reference/requirements.json`, the same index machine-readable, for the\n  [reference gate](reference/enforcement.md)\n";
$c .= "\n**Platform profiles.** Findings about one product at one date. They do not\ngeneralize to the product category.\n\n";
$c .= sprintf "- [%s](%s)\n", title_of($_), $_ for @profiles;

$c .= "\n---\n\n## Templates\n\nA completed template is the evidence that a requirement was satisfied.\n\n";
$c .= sprintf "- [%s](%s)\n", title_of($_), $_ for @templates;

$c .= "\n---\n\n## Everything else\n\n";
$c .= "- [Home](index.md)\n- [Executive summary](overview.md), the argument and the limits\n- [Quick reference](quick-ref.md), everything binding on one printable page\n- [Changelog](CHANGELOG.md), what each edition changed and what was wrong before\n- [Source ledger](SOURCES.md), retrieval and review-by dates\n- [Contributing](CONTRIBUTING.md)\n";

# ---------------------------------------------------------------------------
# reference/requirement-index.md

my @all;
for my $f (@model) {
  my (undef, $reqs) = parse_chapter($f);
  push @all, map { { %$_, file => $f, chapter => title_of($f) } } @$reqs;
}

my $total = scalar @all;
my $r = <<"RHEAD";
---
title: "Requirement Index"
parent: "Technical and Evidence References"
nav_order: 6
---

# Requirement Index

All **$total numbered requirements**, in order, each linking to the subsection
it sits in. Generated by `tools/build-nav.pl`; do not edit by hand.

This page exists because the
[amendments template](../templates/amendments-template.md) records an adoption
as a **delta keyed to requirement numbers**, and a document meant to be amended
that way needs somewhere to look a number up.

**A requirement is never renumbered.** New ones are appended within their
chapter, which is why some chapters run out of positional order.

RHEAD

my $last = '';
for my $q (@all) {
  if ($q->{chapter} ne $last) {
    $last = $q->{chapter};
    $r .= sprintf "\n## %s\n\n| Req | What it requires |\n|:--|:--|\n", $last;
  }
  my $anchor = $q->{sub} ? '#' . slug($q->{sub}) : '';
  my $label  = $q->{name} ne '' ? $q->{name} : $q->{summary};
  $label =~ s/\|/\\|/g;
  $r .= sprintf "| [**%s**](../%s%s) | %s |\n", $q->{num}, $q->{file}, $anchor, $label;
}

# ---------------------------------------------------------------------------
# reference/requirements.json
#
# Only what is mechanically derivable from the chapter text. Tier applicability
# and the evidence artifact are deliberately NOT emitted per requirement,
# because they are not recoverable: tier is stated variously in a requirement's
# own prose, in a table several lines above a block of requirements, or only in
# the chapter's Applicability section. Emitting a guess per requirement would be
# documenting a control this file does not actually know, which is the one thing
# the model tells you never to do.
#
# The verification points are emitted instead, because those genuinely do carry
# a tier and a template, and they are what a gate can check.

sub jstr {
  my $s = shift; $s = '' unless defined $s;
  $s =~ s/\\/\\\\/g; $s =~ s/"/\\"/g; $s =~ s/\n/\\n/g; $s =~ s/\t/\\t/g;
  $s =~ s/([\x00-\x1f])/sprintf('\\u%04x', ord $1)/ge;
  return '"' . $s . '"';
}

# From model/06-inspections.md requirement 6.2 and the tier table under it.
# Hand-maintained because it is five rows, not 131, and because a wrong entry
# here is visible immediately rather than buried.
my @POINTS = (
  ['H1','Identity and credentials','automated','automated','automated plus human','inspection-gateway-key.md'],
  ['H2','Connections and permissions','automated','automated','automated plus human','inspection-mcp-server.md'],
  ['H3','End-to-end path','automated','automated','automated','' ],
  ['H4','Pre-concealment verification','automated','human','human','inspection-agent-studio.md'],
  ['H5','Final verification','automated','automated','human','production-approval.md'],
);

my $j = "{\n";
$j .= '  "generated_by": ' . jstr('tools/build-nav.pl') . ",\n";
$j .= '  "edition": ' . jstr(do {
        my $e = 'unknown';
        if (open my $h, '<', 'CITATION.cff') {
          while (my $l = <$h>) { if ($l =~ /^version:\s*"?([^"\s]+)"?/) { $e = $1; last } }
          close $h;
        } $e;
      }) . ",\n";
$j .= '  "what_this_is": ' . jstr(
      'Machine-readable index of the numbered requirements. Tier applicability and '
    . 'evidence artifact are not emitted per requirement because they are not '
    . 'derivable from the chapter text. Use verification_points for gating.') . ",\n";
$j .= '  "requirement_count": ' . scalar(@all) . ",\n";

$j .= "  \"verification_points\": [\n";
$j .= join ",\n", map {
    sprintf '    {"id": %s, "name": %s, "tier_1": %s, "tier_2": %s, "tier_3": %s, "template": %s}',
      jstr($_->[0]), jstr($_->[1]), jstr($_->[2]), jstr($_->[3]), jstr($_->[4]),
      ($_->[5] eq '' ? 'null' : jstr('templates/' . $_->[5]));
  } @POINTS;
$j .= "\n  ],\n";

$j .= "  \"requirements\": [\n";
$j .= join ",\n", map {
    sprintf '    {"id": %s, "chapter": %s, "chapter_title": %s, "file": %s, "section": %s, "anchor": %s, "title": %s, "summary": %s, "normative": [%s]}',
      jstr($_->{num}), jstr(chapter_num($_->{file})), jstr($_->{chapter}), jstr($_->{file}),
      jstr($_->{sub}), jstr($_->{sub} ? '#' . slug($_->{sub}) : ''),
      jstr($_->{name}), jstr($_->{summary}),
      join(', ', map { jstr($_) } @{$_->{keywords}});
  } @all;
$j .= "\n  ]\n}\n";

# ---------------------------------------------------------------------------
# write or check

my %out = (
  'contents.md'                     => $c,
  'reference/requirement-index.md'  => $r,
  'reference/requirements.json'     => $j,
  'index.md'                        => splice_block('index.md',       'SPINE', spine_block('model/')),
  'README.md'                       => splice_block('README.md',      'SPINE', spine_block('model/')),
  'model/index.md'                  => splice_block('model/index.md', 'SPINE', spine_block('')),
);

if ($check) {
  my $bad = 0;
  for my $f (sort keys %out) {
    my $have = do { open my $h,'<',$f or do { print "  missing: $f\n"; $bad=1; next }; local $/; <$h> };
    if ($have ne $out{$f}) { print "  stale: $f (run: perl tools/build-nav.pl)\n"; $bad = 1 }
  }
  exit($bad ? 1 : 0);
}

for my $f (sort keys %out) {
  open my $h,'>',$f or die "$f: $!";
  print $h $out{$f};
  close $h;
  print "wrote $f\n";
}
print "$total requirements indexed, spine written into 3 pages\n";
