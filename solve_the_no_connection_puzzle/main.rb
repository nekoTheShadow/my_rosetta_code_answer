# Solve the no connection puzzle: http://rosettacode.org/wiki/Solve_the_no_connection_puzzle
# 以下のようなパズルがある。A-Hのペグに1-8までの数値を重複なく当てはめていくが、このとき隣あるペグ同時の数値の差は1より大きい必要がある。
# たとえばA=3とした場合、E=4あるいはE=2とすることはできない。
#     A   B
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# C - D - E - F
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     G   H

connections = {
  A: [:C, :D, :E],
  B: [:D, :E, :F],
  C: [:A, :D, :G],
  D: [:A, :B, :C, :E, :G, :H],
  E: [:A, :B, :D, :F, :G, :H],
  F: [:B, :E, :H],
  G: [:C, :D, :E],
  H: [:D, :E, :F]
}

stack = [{}]
puzles = []
while (puzle = stack.pop)
  peg = (:A..:H).find{|key| !puzle.key?(key)}
  if peg.nil?
    puzles << puzle
    next
  end

  # すでに利用されている数字はだめ かつ 未使用の数字でも隣との差が1になる数字はだめ。
  next_digits = connections.keys.select{|next_peg| connections[next_peg].include?(peg)}.map{|next_peg| puzle[next_peg]}.compact
  digits = (1..8).select do |digit|
    !puzle.value?(digit) && next_digits.all?{|next_digit| (digit - next_digit).abs > 1}
  end
  
  digits.each do |digit|
    temp = puzle.dup
    temp[peg] = digit
    stack << temp
  end
end

puzles.each{|puzle| p puzle}
# {:A=>6, :B=>5, :C=>2, :D=>8, :E=>1, :F=>7, :G=>4, :H=>3}
# {:A=>6, :B=>4, :C=>2, :D=>8, :E=>1, :F=>7, :G=>5, :H=>3}
# {:A=>6, :B=>3, :C=>2, :D=>8, :E=>1, :F=>7, :G=>5, :H=>4}
# {:A=>6, :B=>3, :C=>2, :D=>8, :E=>1, :F=>7, :G=>4, :H=>5}
# {:A=>5, :B=>6, :C=>7, :D=>1, :E=>8, :F=>2, :G=>3, :H=>4}
# {:A=>5, :B=>4, :C=>7, :D=>1, :E=>8, :F=>2, :G=>3, :H=>6}
# {:A=>5, :B=>4, :C=>2, :D=>8, :E=>1, :F=>7, :G=>6, :H=>3}
# {:A=>5, :B=>3, :C=>2, :D=>8, :E=>1, :F=>7, :G=>6, :H=>4}
# {:A=>4, :B=>6, :C=>7, :D=>1, :E=>8, :F=>2, :G=>3, :H=>5}
# {:A=>4, :B=>5, :C=>7, :D=>1, :E=>8, :F=>2, :G=>3, :H=>6}
# {:A=>4, :B=>5, :C=>2, :D=>8, :E=>1, :F=>7, :G=>6, :H=>3}
# {:A=>4, :B=>3, :C=>2, :D=>8, :E=>1, :F=>7, :G=>6, :H=>5}
# {:A=>3, :B=>6, :C=>7, :D=>1, :E=>8, :F=>2, :G=>5, :H=>4}
# {:A=>3, :B=>6, :C=>7, :D=>1, :E=>8, :F=>2, :G=>4, :H=>5}
# {:A=>3, :B=>5, :C=>7, :D=>1, :E=>8, :F=>2, :G=>4, :H=>6}
# {:A=>3, :B=>4, :C=>7, :D=>1, :E=>8, :F=>2, :G=>5, :H=>6}

template = DATA.each_line.to_a
puzles.each do |puzle|
  copied = template.map(&:dup)
  puzle.each do |peg, digit|
    idx = (0...copied.size).find{|x| copied[x].include?(peg.to_s)}
    copied[idx].gsub!(peg.to_s, digit.to_s) 
  end
  puts copied.join
end

#     6   5
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     4   3
# =============
#     6   4
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     5   3
# =============
#     6   3
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     5   4
# =============
#     6   3
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     4   5
# =============
#     5   6
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     3   4
# =============
#     5   4
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     3   6
# =============
#     5   4
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     6   3
# =============
#     5   3
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     6   4
# =============
#     4   6
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     3   5
# =============
#     4   5
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     3   6
# =============
#     4   5
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     6   3
# =============
#     4   3
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 2 - 8 - 1 - 7
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     6   5
# =============
#     3   6
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     5   4
# =============
#     3   6
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     4   5
# =============
#     3   5
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     4   6
# =============
#     3   4
#    /|\ /|\
#   / | X | \
#  /  |/ \|  \
# 7 - 1 - 8 - 2
#  \  |\ /|  /
#   \ | X | /
#    \|/ \|/
#     5   6
# =============

__END__
    A   B
   /|\ /|\
  / | X | \
 /  |/ \|  \
C - D - E - F
 \  |\ /|  /
  \ | X | /
   \|/ \|/
    G   H
=============