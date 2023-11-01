%%
clear
%%
c=calc();

%
shopNumbers=[1, 2, 3, 4];
customerNumber=30;
productVectorMultiShop = c.getProductVectorMultiShop(customerNumber, shopNumbers);

% 複数の店舗から全顧客の商品の有無を集計
productVectorMultiShopSum = c.getProductVectorMultiShopSum(shopNumbers);

% 最も商品の合計値が高くなる店舗の組み合わせを計算
n = 3; % 取得したい店舗の数
combinationTable = c.getCombination(n);

%% 全ての組み合わせで計算してエクセルに出力

for i=1:17
    combinationTable = c.getCombination(i);
    % 列名を追加
    combinationTable.RowName = combinationTable.Properties.RowNames;
    sorted = sortrows(combinationTable,"rankings");
    writetable(sorted,sprintf('output%d.xlsx',i))
end
