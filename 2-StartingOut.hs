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

-- const function
conanO'Brien = "It's me, Conan O'Brien"

-- lists
lostNumbers = [4, 8, 15, 16, 23, 42]
-- lostNumbers !! 0 == 4
-- add last slow
lostNumbers' = lostNumbers ++ [-123]

b = [[1, 2, 3, 4], [5, 3, 3, 3], [1, 2, 2, 3, 4], [1, 2, 3]]
-- add first fast
b' = [99] : b

-- -|------ ~ head|tail
-- ------|- ~ init|last
-- head - first element in list
bHead = head b
-- tail - list without head
bTail = tail b
-- last - last element in list
bLast = last b
-- init - list without last element
bInit = init b
-- list length
bLength = length b
bLength2 = length (b !! 2)
--  null - check list == []
bNull = null b -- False
emptyNull = null [] -- True
-- reverse - list in reverse order
bReverse = reverse b
-- take - get n elements from begin
bTake = take 2 b
-- drop - cut n elements from begin
bDrop = drop 1 b
-- maximum - get max elements from list
bMax = maximum b
lostNumberMax = maximum lostNumbers
-- minimum - -//-
bMin = minimum b

num = [1, 2, 3, 4, 5]
-- sum - sum list elements
numSum = sum num
-- product - *
numProd = product num
-- elem -- true if element in list
bElem = [1, 2, 3, 4] `elem` b
numElem = elem 7 num
