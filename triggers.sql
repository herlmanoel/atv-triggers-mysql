DELIMITER $$
CREATE TRIGGER insert_ItensVenda AFTER INSERT ON ItensVenda
    FOR EACH ROW
        BEGIN
            update Produtos set Estoque = Estoque new.Quantidade where Referencia = new.Produto;
END$$

DELIMITER $$
CREATE TRIGGER delete_ItensVenda AFTER DELETE ON ItensVenda
    FOR EACH ROW
    BEGIN
        update Produtos set Estoque Estoque + new.Quantidade where Referencia = new.Produto;
END$$

DELIMITER $$
CREATE TRIGGER update_ItensVenda AFTER UPDATE ON ItensVenda
    FOR EACH ROW
        BEGIN
            IF (new.Quantidade > old.Quantidade) then
                update Produtos set Estoque = Estoque + (new.Quantidade old.Quantidade) where Referencia = new.Produto;
            ELSEIF new.Quantidade < old.Quantidade then
                update Produtos set Estoque Estoque (new.Quantidade old.Quantidade) where Referencia = new.Produto;
            END IF;
END$$
