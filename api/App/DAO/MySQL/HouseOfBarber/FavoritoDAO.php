<?php 
    namespace App\DAO\MySQL\HouseOfBarber;

    use App\Models\MySQL\HouseOfBarber\FavoritoModel;

    class FavoritoDAO extends Conexao{
        public function __construct()
        {
            parent::__construct();
        }

        public function getAll(): array
        {
            $query = "SELECT 
                    *
                FROM favorito
            ";

            $favoritos = $this->pdo->query($query)->fetchAll(\PDO::FETCH_ASSOC);

            return $favoritos;
        }

        public function findById(string $estabelecimentoId): array
        {
            $query = "SELECT 
                    *
                FROM favorito
                WHERE 
                    estabelecimento_id = :estabelecimento_id
            ";

            $statement = $this->pdo->prepare($query);
            $statement->execute([
                "estabelecimento_id" => $estabelecimentoId
            ]);

            $favorito = $statement->fetchAll(\PDO::FETCH_ASSOC);

            return $favorito;
        }

        public function insertFavorito(FavoritoModel $favorito): bool
        {
            $query = "INSERT INTO favorito(
                estabelecimento_id,
                cliente_id
            ) VALUES (
                :estabelecimento_id,
                :cliente_id
            )";

            $statement = $this->pdo->prepare($query);
            $result = $statement->execute([
                "estabelecimento_id" => $favorito->getEstabelecimentoId(),
                "cliente_id" => $favorito->getClienteId(),
            ]);

            return $result;
        }

        public function updateFavorito(FavoritoModel $favorito, int $estabelecimentoId): bool
        {
           $query = "UPDATE favorito
                SET
                    estabelecimento_id = :estabelecimento_id,
                    cliente_id = :cliente_id
            WHERE estabelecimento_id = :estabelecimento_id";

            $statement = $this->pdo->prepare($query);
            $result = $statement->execute([
                "estabelecimento_id" => $favorito->getEstabelecimentoId(),
                "cliente_id" => $favorito->getClienteId(), 
                "estabelecimento_id" => $estabelecimentoId
            ]);

            return $result;
        }

        public function deleteFavorito(int $estabelecimentoId): bool
        {
            $query = "DELETE FROM favorito
                WHERE estabelecimento_id = :estabelecimento_id
            ";

            $statement = $this->pdo->prepare($query);
            $result = $statement->execute([
                "estabelecimento_id" => $estabelecimentoId
            ]);

            return $result;
        }
    }