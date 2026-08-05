#!/usr/bin/env perl
# Generates contents.md and reference/requirement-index.md from the source files.
#
#   perl tools/build-nav.pl           write the files
#   perl tools/build-nav.pl --check   exit non-zero if the committed files are stale
#
# These are generated for the reason requirement 7.9 gives: anything that can be
# generated should be, because generated content cannot drift out of step with
# what it describes. Editing them by hand will be reverted by the next run and
# will fail the check in tools/check.sh.

use strict;
use warnings;

my $check = (@ARGV && $ARGV[0] eq '--check');

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
    my $sum = join ' ', @body;
    $sum =~ s/\*\*//g; $sum =~ s/^\s+|\s+$//g;
    $sum =~ s/\s+/ /g;
    $sum =~ s/^([^.]{0,110}?[.])\s.*$/$1/;      # first sentence if short enough
    if (length $sum > 116) { $sum = substr($sum,0,113); $sum =~ s/\s+\S*$//; $sum .= '...' }
    push @reqs, { num => $pending->[0], name => $pending->[1], sub => $pending->[2], summary => $sum };
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
# write or check

my %out = ('contents.md' => $c, 'reference/requirement-index.md' => $r);

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
print "$total requirements indexed\n";
