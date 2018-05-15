"""
Floyd's triangle: http://rosettacode.org/wiki/Floyd%27s_triangle
フロイドの三角形--というのか? 条件を満たす図形を作画する問題。
ただし通常モードとpretty-printモードをそれぞれ作成する必要がある。
"""

def draw_floyds_triangle(rownum, is_pretty=False):
    triangle = [[1]]
    for i in range(2, rownum + 1):
        triangle.append([triangle[-1][-1] + diff for diff in range(1, i + 1)])
    
    if is_pretty:
        size = len(str(triangle[-1][-1]))
        for row in triangle:
            print(' '.join(str(cell).rjust(size) for cell in row))
    else:
        for row in triangle:
            print(' '.join(map(str, row)))
        
if __name__ == '__main__':
    draw_floyds_triangle(5)
    draw_floyds_triangle(14)
    draw_floyds_triangle(5, is_pretty=True)
    draw_floyds_triangle(14, is_pretty=True)

    # 1
    # 2 3
    # 4 5 6
    # 7 8 9 10
    # 11 12 13 14 15
    # 1
    # 2 3
    # 4 5 6
    # 7 8 9 10
    # 11 12 13 14 15
    # 16 17 18 19 20 21
    # 22 23 24 25 26 27 28
    # 29 30 31 32 33 34 35 36
    # 37 38 39 40 41 42 43 44 45
    # 46 47 48 49 50 51 52 53 54 55
    # 56 57 58 59 60 61 62 63 64 65 66
    # 67 68 69 70 71 72 73 74 75 76 77 78
    # 79 80 81 82 83 84 85 86 87 88 89 90 91
    # 92 93 94 95 96 97 98 99 100 101 102 103 104 105
    #  1
    #  2  3
    #  4  5  6
    #  7  8  9 10
    # 11 12 13 14 15
    #   1
    #   2   3
    #   4   5   6
    #   7   8   9  10
    #  11  12  13  14  15
    #  16  17  18  19  20  21
    #  22  23  24  25  26  27  28
    #  29  30  31  32  33  34  35  36
    #  37  38  39  40  41  42  43  44  45
    #  46  47  48  49  50  51  52  53  54  55
    #  56  57  58  59  60  61  62  63  64  65  66
    #  67  68  69  70  71  72  73  74  75  76  77  78
    #  79  80  81  82  83  84  85  86  87  88  89  90  91
    #  92  93  94  95  96  97  98  99 100 101 102 103 104 105