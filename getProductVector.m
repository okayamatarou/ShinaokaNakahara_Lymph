classdef calc
    properties
        dataSheet1
        dataSheet2
    end

    methods
        function obj = calc(filename)
            if nargin < 1
                filename = 'data.xlsx';
            end
            % コンストラクタ: Excelファイルの各シートからデータを読み込む
            obj.dataSheet1 = readtable(filename, 'Sheet', 'sheet1');
            obj.dataSheet2 = readtable(filename, 'Sheet', 'sheet2');
        end

        function productVector = getProductVector(obj, shopNumber, customerNumber)
            % 商品の数
            numProducts = 5;

            % one-hotベクトルの初期化
            productVector = zeros(1, numProducts);

            % 指定された店舗と顧客の商品を探す
            product1 = obj.dataSheet1{customerNumber, shopNumber};
            product2 = obj.dataSheet2{customerNumber, shopNumber};

            % 商品が存在する場合、対応する位置のone-hotベクトルを1に設定
            if ~isnan(product1)
                productVector(product1) = 1;
            end
            if ~isnan(product2)
                productVector(product2) = 1;
            end
        end
    end
end