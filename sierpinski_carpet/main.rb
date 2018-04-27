"""
Sierpinski carpet: http://rosettacode.org/wiki/Sierpinski_carpet
「シェルピンスキーのカーペット」をアスキーアートとして描く問題。
日本語版Wikipedia「シェルピンスキーのカーペット」の記述をそのまま実装しただけである(´・ω・)
https://ja.wikipedia.org/wiki/%E3%82%B7%E3%82%A7%E3%83%AB%E3%83%94%E3%83%B3%E3%82%B9%E3%82%AD%E3%83%BC%E3%81%AE%E3%82%AB%E3%83%BC%E3%83%9A%E3%83%83%E3%83%88
"""

import itertools

def solve(order):
    def draw(carpet, x, y, m):
        if m == 3:
            return 
        
        for dx, dy in itertools.product((0, 1, 2), repeat=2):
            n = m // 3
            i, j = x + n * dx, y + n * dy
            if dx == dy == 1:
                for p, q in itertools.product(range(n), repeat=2):
                    carpet[i + p][j + q] = ' '
            else:
                draw(carpet, i, j, n)
    
    m = 3 ** order
    carpet = [['#' for _ in range(m)] for _ in range(m)]
    draw(carpet, 0, 0, m)
    return '\n'.join(''.join(row) for row in carpet)


if __name__ == '__main__':
    print(solve(3))
    print(solve(4))


###########################
###########################
###########################
###   ######   ######   ###
###   ######   ######   ###
###   ######   ######   ###
###########################
###########################
###########################
#########         #########
#########         #########
#########         #########
###   ###         ###   ###
###   ###         ###   ###
###   ###         ###   ###
#########         #########
#########         #########
#########         #########
###########################
###########################
###########################
###   ######   ######   ###
###   ######   ######   ###
###   ######   ######   ###
###########################
###########################
###########################

#################################################################################
#################################################################################
#################################################################################
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
#################################################################################
#################################################################################
#################################################################################
#########         ##################         ##################         #########
#########         ##################         ##################         #########
#########         ##################         ##################         #########
###   ###         ###   ######   ###         ###   ######   ###         ###   ###
###   ###         ###   ######   ###         ###   ######   ###         ###   ###
###   ###         ###   ######   ###         ###   ######   ###         ###   ###
#########         ##################         ##################         #########
#########         ##################         ##################         #########
#########         ##################         ##################         #########
#################################################################################
#################################################################################
#################################################################################
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
#################################################################################
#################################################################################
#################################################################################
###########################                           ###########################
###########################                           ###########################
###########################                           ###########################
###   ######   ######   ###                           ###   ######   ######   ###
###   ######   ######   ###                           ###   ######   ######   ###
###   ######   ######   ###                           ###   ######   ######   ###
###########################                           ###########################
###########################                           ###########################
###########################                           ###########################
#########         #########                           #########         #########
#########         #########                           #########         #########
#########         #########                           #########         #########
###   ###         ###   ###                           ###   ###         ###   ###
###   ###         ###   ###                           ###   ###         ###   ###
###   ###         ###   ###                           ###   ###         ###   ###
#########         #########                           #########         #########
#########         #########                           #########         #########
#########         #########                           #########         #########
###########################                           ###########################
###########################                           ###########################
###########################                           ###########################
###   ######   ######   ###                           ###   ######   ######   ###
###   ######   ######   ###                           ###   ######   ######   ###
###   ######   ######   ###                           ###   ######   ######   ###
###########################                           ###########################
###########################                           ###########################
###########################                           ###########################
#################################################################################
#################################################################################
#################################################################################
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
#################################################################################
#################################################################################
#################################################################################
#########         ##################         ##################         #########
#########         ##################         ##################         #########
#########         ##################         ##################         #########
###   ###         ###   ######   ###         ###   ######   ###         ###   ###
###   ###         ###   ######   ###         ###   ######   ###         ###   ###
###   ###         ###   ######   ###         ###   ######   ###         ###   ###
#########         ##################         ##################         #########
#########         ##################         ##################         #########
#########         ##################         ##################         #########
#################################################################################
#################################################################################
#################################################################################
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
###   ######   ######   ######   ######   ######   ######   ######   ######   ###
#################################################################################
#################################################################################
#################################################################################