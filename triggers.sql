DELIMITER $$
CREATE TRIGGER insert_ItensVenda AFTER INSERT ON ItensVenda
    FOR EACH ROW
        BEGIN
            update Produtos set Estoque = Estoque - new.Quantidade where Referencia = new.Produto;
END$$

DELIMITER $$
CREATE TRIGGER delete_ItensVenda AFTER DELETE ON ItensVenda
    FOR EACH ROW
        BEGIN
            update Produtos set Estoque = Estoque + old.Quantidade where Referencia = old.Produto;
END$$

DELIMITER $$
CREATE TRIGGER update_ItensVenda AFTER UPDATE ON ItensVenda
    FOR EACH ROW
        BEGIN
            update Produtos set Estoque = Estoque + old.Quantidade - new.Quantidade where Referencia = new.Produto;
END$$
