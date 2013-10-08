-- functions
doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

-- expression - code with return value
-- if_then_else == expression
doubleSmallNumber x = if x > 100
                        then x
                        else x * 2

if' :: Bool -> a -> a -> a
if' True    x _ = x
if' False   _ x = x

doubleSmallNumber' x = if' (x > 100) x (x * 2)

-- When a function doesn't take any parameters, we usually say it's
-- a definition (or a name).
conanO'Brien = "It's me, Conan O'Brien"

-- Lists
--
-- In Haskell, lists are a homogenous data structure. It stores several
-- elements of the same type.
--
lostNumbers = [4, 8, 15, 16, 23, 42]
-- lostNumbers !! 0 == 4
--
-- add last is slow
lostNumbers' = lostNumbers ++ [-123]
-- [4,8,15,16,23,42,-123]

b = [[1, 2, 3, 4], [5, 3, 3, 3], [1, 2, 2, 3, 4], [1, 2, 3]]

-- add first is fast
b' = [99] : b
-- [[99],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]

-- -|------ ~ head|tail
-- ------|- ~ init|last
--
-- head takes a list and returns its head. The head of a list is basically its
-- first element.
bHead = head b
-- [1,2,3,4]

-- tail takes a list and returns its tail. In other words, it chops off
-- a list's head.
bTail = tail b
-- [[5,3,3,3],[1,2,2,3,4],[1,2,3]]

-- last takes a list and returns its last element.
bLast = last b
-- [1,2,3]

-- init takes a list and returns everything except its last element.
bInit = init b
-- [[1,2,3,4],[5,3,3,3],[1,2,2,3,4]]
--
-- head []  
-- *** Exception: Prelude.head: empty list  
--
-- length takes a list and returns its length, obviously.
bLength = length b
-- 4
bLength2 = length (b !! 2)
-- 5

--  null checks if a list is empty. If it is, it returns True, otherwise it
--  returns False. Use this function instead of xs == [] (if you have a list
--  called xs)
bNull = null b
-- False
emptyNull = null []
-- True

-- reverse reverses a list.
bReverse = reverse b
-- [[1,2,3],[1,2,2,3,4],[5,3,3,3],[1,2,3,4]]

-- take takes number and a list. It extracts that many elements from the
-- beginning of the list.
bTake = take 2 b
-- [[1,2,3,4],[5,3,3,3]]

-- drop works in a similar way, only it drops the number of elements from the
-- beginning of a list.
bDrop = drop 1 b
-- [[5,3,3,3],[1,2,2,3,4],[1,2,3]]

-- maximum takes a list of stuff that can be put in some kind of order and
-- returns the biggest element.
bMax = maximum b
-- [5,3,3,3]
lostNumberMax = maximum lostNumbers
-- 42

-- minimum returns the smallest.
bMin = minimum b
-- [1,2,2,3,4]

num = [1, 2, 3, 4, 5]
-- sum takes a list of numbers and returns their sum.
numSum = sum num
-- 15
--
-- product takes a list of numbers and returns their product.
numProd = product num
-- 120
--
-- elem takes a thing and a list of things and tells us if that thing is an
-- element of the list. It's usually called as an infix function because it's
-- easier to read that way.
bElem = [1, 2, 3, 4] `elem` b
-- True
numElem = elem 7 num
-- False

-- Ranges
--
-- Ranges are a way of making lists that are arithmetic sequences of elements
-- that can be enumerated. Numbers can be enumerated. 
alphabet = ['a'..'z']
-- "abcdefghijklmnopqrstuvwxyz"
nums1'20 = [1..20]
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
--
-- Ranges are cool because you can also specify a step.
even0'20 = [0, 2..20]
-- [0,2,4,6,8,10,12,14,16,18,20]
--
-- Watch out when using floating point numbers in ranges! Because they are not
-- completely precise (by definition), their use in ranges can yield some
-- pretty funky results.
badFloatSequences = [0.1,0.3..1]
-- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]
--
div13 = [13,26..24*13]
--
-- Because Haskell is lazy, it won't try to evaluate the infinite list
-- immediately because it would never finish.
-- It'll wait to see what you want to get out of that infinite lists. And here
-- it sees you just want the first 24 elements and it gladly obliges.
div13' = take 24 [13,26..]
--
-- A handful of functions that produce infinite lists:
--
-- cycle takes a list and cycles it into an infinite list. If you just try to
-- display the result, it will go on forever so you have to slice it off
-- somewhere.
one'two = take 10 (cycle [1,2])
-- [1,2,1,2,1,2,1,2,1,2]
nyak = take (10*6) (cycle "nyak! ")
-- "nyak! nyak! nyak! nyak! nyak! nyak! nyak! nyak! nyak! nyak! "
--
-- repeat takes an element and produces an infinite list of just that element.
-- It's like cycling a list with only one element.
ten'ten = take 10 (repeat 10)
-- [10,10,10,10,10,10,10,10,10,10]
--
-- Although it's simpler to just use the replicate function if you want some
-- number of the same element in a list.
replQ = replicate 10 'Q'
-- "QQQQQQQQQQ"

-- List comprehension
--
-- List comprehensions are very similar to set comprehensions. We'll stick to
-- getting the first 10 even numbers for now.
list1 = [x * 2 | x <- [1..10]]
-- [2,4,6,8,10,12,14,16,18,20]
--
--Now let's add a condition (or a predicate) to that comprehension. Predicates
--go after the binding parts and are separated from them by a comma. Let's say
--we want only the elements which, doubled, are greater than or equal to 12.
list2 = [x * 2 | x <- [1..20], x * 2 >= 12]
-- [12,14,16,18,20,22,24,26,28,30,32,34,36,38,40]
--
-- Note that weeding out lists by predicates is also called filtering.
list3 = [x | x <- [50..100], mod x 7 == 3]
-- [52,59,66,73,80,87,94]
--
boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
boomBangs7'13 = boomBangs [7..13]
-- ["BOOM!","BOOM!","BANG!","BANG!"]
--
list4 = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]
-- [10,11,12,14,16,17,18,20]
list5 = [x ++ y | x <- ["a","b","c"], y <- ["1","2"]]
-- ["a1","a2","b1","b2","c1","c2"]
--
length' xs = sum [1 | _ <- xs]
removeNonUpperCase st = [c | c <- st, c `elem` ['A'..'Z']]
iLikeJava = removeNonUpperCase "Idon'tLIKEJAVA"
-- "ILIKEJAVA"
list6 = [[1,2,3,4,5,6],[7,8,1,2],[9,1,2,7,2,5,8]]
list6Even = [[x | x <- xs, even x] | xs <- list6]
-- [[2,4,6],[8,2],[2,2,8]]
--
-- Tuples
--
-- In some ways, tuples are like lists — they are a way to store several values
-- into a single value.
--
-- ()
-- (1,2)
-- [(1,'a'),(8,'b'),(92,'z')]
--
-- Two useful functions that operate on pairs:
--
-- fst takes a pair and returns its first component.
fst1 = fst (8,11)
-- 8
fst2 = fst ("abc", 99)
-- "abc"
--
-- snd takes a pair and returns its second component. Surprise!
snd1 = snd (8,11)
-- 11
snd2 = snd ("abc", 99)
-- 99
--
-- zip. It takes two lists and then zips them together into one list by joining
-- the matching elements into pairs.
--
zip1 = zip [1,2,3,4,5] [5,5,5,5,5]
-- [(1,5),(2,5),(3,5),(4,5),(5,5)]
zip2 = zip [1..] ["apple", "orange", "cherry", "mango"]
-- [(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]
--
-- Example
-- Here's a problem that combines tuples and list comprehensions: which right
-- triangle that has integers for all sides and all sides equal to or smaller
-- than 10 has a perimeter of 24?
--
triangles = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b],
            a^2 + b^2 == c^2, a+b+c == 24]
