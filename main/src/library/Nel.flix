/*
 * Copyright 2020 Magnus Madsen
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

///
/// The NonEmptyList type.
///

pub enum Nel[a] {
    case Nel(a, List[a])
}

namespace Nel {

    ///
    /// Returns the first element of `xs`.
    ///
    pub def head(xs: Nel[a]): a = match xs {
        case Nel(h, _) => h
    }

    ///
    /// Returns the last element of `xs`.
    ///
    pub def last(xs: Nel[a]): a = match xs {
        case Nel(h, l) => Option.getWithDefault(List.last(l), h)
    }

    ///
    /// Returns all elements in `xs` without the last element.
    ///
    pub def init(xs: Nel[a]): List[a] = match xs {
        case Nel(_, Nil) => Nil
        case Nel(h, l)   => match List.reverse(l) {
            case Nil     => h :: Nil
            case _ :: xs => h :: List.reverse(xs)
        }
    }

    ///
    /// Returns all elements in `xs` without the first element.
    ///
    pub def tail(xs: Nel[a]): List[a] = match xs {
        case Nel(_, l) => l
    }

    ///
    /// Returns the length of `xs`.
    ///
    pub def length(xs: Nel[a]): Int = match xs {
        case Nel(_, l) => 1 + List.length(l)
    }

    ///
    /// Returns `ys` appended to `xs`.
    ///
    pub def append(xs: Nel[a], ys: Nel[a]): Nel[a] = match (xs, ys) {
        case (Nel(h1, l1), Nel(h2, l2)) => Nel(h1, l1 ::: (h2 :: l2))
    }

    ///
    /// Returns `true` if and only if `xs` contains the element `a`.
    ///
    pub def memberOf(a: a, xs: Nel[a]): Bool = match xs {
        case Nel(h, l) => h == a || List.memberOf(a, l)
    }

    ///
    /// Alias for `findLeft`.
    ///
    pub def find(f: a -> Bool, xs: Nel[a]): Option[a] = findLeft(f, xs)

    ///
    /// Optionally returns the first element of `xs` that satisfies the predicate `f` when searching from left to right.
    ///
    pub def findLeft(f: a -> Bool, xs: Nel[a]): Option[a] = match xs {
        case Nel(h, l) => if (f(h)) Some(h) else List.findLeft(f, l)
    }

    ///
    /// Optionally returns the first element of `xs` that satisfies the predicate `f` when searching from right to left.
    ///
    pub def findRight(f: a -> Bool, xs: Nel[a]): Option[a] = match xs {
        case Nel(h, l) => match List.findRight(f, l) {
            case None    => if (f(h)) Some(h) else None
            case Some(x) => Some(x)
        }
    }

    ///
    /// Returns the result of applying `f` to every element in `xs`.
    ///
    /// That is, the result is of the form: `f(x1) :: f(x2) :: ...`.
    ///
    pub def map(f: a -> b & e, xs: Nel[a]): Nel[b] & e = match xs {
        case Nel(h, l) => Nel(f(h), List.map(f, l))
    }

    ///
    /// Returns the result of applying `f` to every element in `xs` along with that element's index.
    ///
    /// That is, the result is of the form: `f(x1, 0) :: f(x2, 1) :: ...`.
    ///
    pub def mapWithIndex(f: (a, Int32) -> b & e, xs: Nel[a]): Nel[b] & e = match xs {
        case Nel(h, l) => Nel(f(h, 0), mapWithIndexHelper(f, l, 1))
    }

    ///
    /// Helper function for `mapWithIndex`.
    ///
    def mapWithIndexHelper(f: (a, Int32) -> b & e, xs: List[a], i: Int32): List[b] & e = match xs {
        case Nil     => Nil
        case x :: rs => f(x, i) :: mapWithIndexHelper(f, rs, i + 1)
    }

    ///
    /// Returns the result of applying `f` to every element in `xs` and concatenating the results.
    ///
    pub def flatMap(f: a -> Nel[b] & e, xs: Nel[a]): Nel[b] & e = match xs {
        case Nel(h, l) => match f(h) {
            case Nel(h1, l1) => Nel(h1, l1 ::: List.flatMap(x -> toList(f(x)), l))
        }
    }

    ///
    /// Returns the reverse of `xs`.
    ///
    pub def reverse(xs: Nel[a]): Nel[a] = match xs {
        case Nel(h, l) => match List.reverse(h :: l) {
            case y :: ys => Nel(y, ys)
            case _       => panic "unreachable"
        }
    }

    ///
    /// Returns `xs` with every occurrence of `x` replaced by `y`.
    ///
    pub def replace(x: a, y: a, xs: Nel[a]): Nel[a] = map(e -> if (e == x) y else e, xs)

    ///
    /// Returns all permutations of `xs` in lexicographical order by element indices in `xs`.
    ///
    /// That is, `xs` is the first permutation and `reverse(xs)` is the last permutation.
    ///
    pub def permutations(xs: Nel[a]): Nel[List[a]] = match xs {
        case Nel(h, l) => match List.permutations(h :: l) {
            case y :: ys => Nel(y, ys)
            case Nil => panic "unreachable"
        }
    }

    ///
    /// Returns all subsequences of `xs` in lexicographical order by element indices in `xs`.
    ///
    /// That is, `xs` is the first subsequence and `Nil` is the last subsequence.
    ///
    pub def subsequences(xs: Nel[a]): Nel[List[a]] = match xs {
        case Nel(h, l) => match List.subsequences(h :: l) {
            case y :: ys => Nel(y, ys)
            case Nil => panic "unreachable"
        }
    }

    ///
    /// Returns `xs` with `a` inserted between every two adjacent elements.
    ///
    pub def intersperse(a: a, xs: Nel[a]): Nel[a] = match xs {
        case Nel(h, Nil) => Nel(h, Nil)
        case Nel(h, l)   => Nel(h, a :: List.intersperse(a, l))
    }

    ///
    /// Alias for `foldLeft`.
    ///
    pub def fold(f: (b, a) -> b, s: b, xs: Nel[a]): b = foldLeft(f, s, xs)

    ///
    /// Applies `f` to a start value `s` and all elements in `xs` going from left to right.
    ///
    /// That is, the result is of the form: `f(...f(f(s, x1), x2)..., xn)`.
    ///
    pub def foldLeft(f: (b, a) -> b, s: b, xs: Nel[a]): b = match xs {
        case Nel(h, l) => List.foldLeft(f, f(s, h), l)
    }

    ///
    /// Applies `f` to a start value `s` and all elements in `xs` going from right to left.
    ///
    /// That is, the result is of the form: `f(x1, ...f(xn-1, f(xn, s))...)`.
    ///
    pub def foldRight(f: (a, b) -> b, s: b, xs: Nel[a]): b = match xs {
        case Nel(h, l) => f(h, List.foldRight(f, s, l))
    }

    ///
    /// Alias for `reduceLeft`.
    ///
    pub def reduce(f: (a, a) -> a, xs: Nel[a]): a = reduceLeft(f, xs)

    ///
    /// Applies `f` to all elements in `xs` going from left to right until a single value `v` is obtained.
    ///
    /// That is, the result is of the form: `f(...f(f(x1, x2), x3)..., xn)`
    ///
    pub def reduceLeft(f: (a, a) -> a, xs: Nel[a]): a = match xs {
        case Nel(h, l) => List.foldLeft(f, h, l)
    }

    ///
    /// Applies `f` to all elements in `xs` going from right to left until a single value `v` is obtained.
    ///
    /// That is, the result is of the form: `Some(f(x1, ...f(xn-2, f(xn-1, xn))...))`
    ///
    pub def reduceRight(f: (a, a) -> a, xs: Nel[a]): a = match xs {
        case Nel(h, l) => match List.reduceRight(f, h :: l) {
            case None    => panic "unreachable"
            case Some(v) => v
        }
    }

    ///
    /// Returns the number of elements in `xs` that satisfy the predicate `f`.
    ///
    pub def count(f: a -> Bool, xs: Nel[a]): Int32 = match xs {
        case Nel(h, l) => (if (f(h)) 1 else 0) + List.count(f, l)
    }

    ///
    /// Returns the concatenation of the elements in `xs`.
    ///
    pub def flatten(xs: Nel[Nel[a]]): Nel[a] = match xs {
        case Nel(Nel(h, ys), zs) => Nel(h, ys ::: List.flatMap(toList, zs))
    }

    ///
    /// Returns `true` if and only if at least one element in `xs` satisfies the predicate `f`.
    ///
    pub def exists(f: a -> Bool, xs: Nel[a]): Bool = match xs {
        case Nel(h, l) => f(h) || List.exists(f, l)
    }

    ///
    /// Returns `true` if and only if all elements in `xs` satisfy the predicate `f`.
    ///
    pub def forall(f: a -> Bool, xs: Nel[a]): Bool = match xs {
        case Nel(h, l) => f(h) && List.forall(f, l)
    }

    ///
    /// Returns a list of every element in `xs` that satisfies the predicate `f`.
    ///
    pub def filter(f: a -> Bool, xs: Nel[a]): List[a] = match xs {
        case Nel(h, l) =>
            if (f(h))
                h :: List.filter(f, l)
            else
                List.filter(f, l)
    }

    ///
    /// Returns a non-empty list where the element at index `i` is `(a, b)` where
    /// `a` is the element at index `i` in `xs` and `b` is the element at index `i` in `ys`.
    ///
    /// If either `xs` or `ys` becomes depleted, then no further elements are added to the resulting list.
    ///
    pub def zip(xs: Nel[a], ys: Nel[b]): Nel[(a,b)] = match (xs, ys) {
        case (Nel(h1, l1), Nel(h2, l2)) => Nel((h1, h2), List.zip(l1, l2))
    }

    ///
    /// Returns a non-empty list where the element at index `i` is `f(a, b)` where
    /// `a` is the element at index `i` in `xs` and `b` is the element at index `i` in `ys`.
    ///
    /// If either `xs` or `ys` becomes depleted, then no further elements are added to the resulting list.
    ///
    pub def zipWith(f: (a, b) -> c, xs: Nel[a], ys: Nel[b]): Nel[c] = match (xs, ys) {
        case (Nel(h1, l1), Nel(h2, l2)) => Nel(f(h1, h2), List.zipWith(f, l1, l2))
    }

    ///
    /// Returns a pair of non-empty lists, the first containing all first components in `xs`
    /// and the second containing all second components in `xs`.
    ///
    pub def unzip(xs: Nel[(a, b)]): (Nel[a], Nel[b]) = match xs {
        case Nel((a, b), l) =>
            let (l1, l2) = List.unzip(l);
            (Nel(a, l1), Nel(b, l2))
    }

    ///
    /// Returns `xs` as a normal list.
    ///
    pub def toList(xs: Nel[a]): List[a] = match xs {
        case Nel(h, l) => h :: l
    }

    ///
    /// Applies `f` to every element of `xs`.
    ///
    /// The function `f` must be impure.
    ///
    pub def foreach(f: a ~> Unit, xs: Nel[a]): Unit & Impure = match xs {
        case Nel(h, l) => f(h); List.foreach(f, l)
    }

    ///
    /// Returns `true` if and only if `xs` and `ys` and equal.
    ///
    pub def __eq(xs: Nel[a], ys: Nel[a]): Bool = match (xs, ys) {
        case (Nel(x, l1), Nel(y, l2)) => x == y && l1 == l2
    }

}

