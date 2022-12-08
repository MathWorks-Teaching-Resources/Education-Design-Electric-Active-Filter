function tfModel = sym2tf_ykamatan(Symbole_Eq)
%SYM2TF_YKAMATAN 
% Symbolic Math Toolboxのシンボル式で記述した伝達関数式を
% Control Design Toolboxで扱える伝達関数モデルに変換します
%
% Argment: subs関数であらかじめパラメータを代入済みのSymbole_Eq:Symbol形式で記述された伝達関数
% Retern : Control Design Toolboxで扱える伝達関数モデル
%
% Copyright (c) 2022, The MathWorks, Inc. All rights reserved.

    %シンボル式としてラプラス演算子sを定義
    syms s
    
    %分母分子を分解
    [n, d] = numden(Symbole_Eq);

    %ラプラス演算子に対する分母、分子それぞれの係数を抽出
    n = coeffs(n,s,'All');
    d = coeffs(d,s,'All');
    
    %double()で浮動小数点値として評価してtfに代入
    tfModel = tf(double(subs(n)),double(subs(d)));
end

