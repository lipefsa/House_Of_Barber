<?php 
    namespace App\Controllers;

    use Psr\Http\Message\RequestInterface as Request;
    use Psr\Http\Message\ResponseInterface as Response;

    use App\DAO\MySQL\HouseOfBarber\FavoritoDAO;
    use App\Models\MySQL\HouseOfBarber\FavoritoModel;
    use App\Assets\BaseLib\App\Utilities;
    use App\DAO\MySQL\HouseOfBarber\AutenticarDAO;
    use App\Models\MySQL\HouseOfBarber\AutenticarModel;

    final class FavoritoController{
        public function getFavoritos(Request $request, Response $response, array $args): Response 
        {
            $favoritoDAO = new FavoritoDAO();
            $favoritos = $favoritoDAO->getAll();

            $response = $response->withJson($favoritos);
            
            return $response;
        }

        public function getFavorito(Request $request, Response $response, array $args): Response 
        {
            if(isset($args['id'])){
                $id = $args['id'];
    
                if(is_numeric($id)){
                    $favoritoDAO = new FavoritoDAO();
                    $favorito = $favoritoDAO->findById($id);
        
                    $response = $response->withJson($favorito);
                }
                else{
                    $response = $response->withJson([
                        "message" => "Informe um id númerico",
                        "error" => "true"
                    ]);
                }
            }
            else{
                $response = $response->withJson([
                    "message" => "Informe o id",
                    "error" => "true"
                ]);
            }

            return $response;
        }
        
        public function insertFavorito(Request $request, Response $response, array $args): Response 
        {
            $data = $request->getParsedBody();

            $headers = $request->getHeaders();

            if(isset($headers['HTTP_TOKEN'])){
                $token = $headers['HTTP_TOKEN'][0];
                
                $autenticarDAO = new AutenticarDAO();
                $autenticarModel = new AutenticarModel();

                $autenticarModel->setToken($token);

                $tokenData = $autenticarDAO->findUserByToken($autenticarModel);

                if($tokenData && count($tokenData) > 0){
                    $data = $request->getParsedBody();

                    if($data && count($data) > 0){
                        $fieldsNecessary = ['estabelecimento_id'];
                        $data = Utilities::treatRequestBody($data, 'PDO');

                        $correctFieldsInformed = Utilities::verifyAmountFields($fieldsNecessary, $data);

                        if($correctFieldsInformed){
                            $clienteId = $tokenData[0]["id_usuario"];

                            $favoritoDAO = new FavoritoDAO();
                            $favoritoModel = new FavoritoModel();
                        
                            $favoritoModel->setEstabelecimentoId($data['estabelecimento_id']);
                            $favoritoModel->setClienteId($clienteId);
                            
                            $queryStatus = $favoritoDAO->insertFavorito($favoritoModel);
                
                            if($queryStatus){
                                $response = $response->withJson([
                                    "message" => "Favoritado com sucesso",
                                    "error" => "false"
                                ]);
                            }
                            else{
                                $response = $response->withJson([
                                    "message" => "Erro ao inserir o estabelecimento favoritado",
                                    "error" => "true"
                                ]);
                            }
                        }
                        else{
                            $response = $response->withJson([
                                "message" => "Informe todos os campos necessários para a inserção",
                                "error" => "true"
                            ]);
                        }
                    }
                    else{
                        $response = $response->withJson([
                            "message" => "Informe o campos a serem inseridos",
                            "error" => "true"
                        ]);
                    }
                }
                else{
                    $response = $response->withJson([
                        "message" => "Token inválido",
                        "error" => "true"
                    ]);
                }
            }
            else{
                $response = $response->withJson([
                    "message" => "Informe o token do usuário logado",
                    "error" => "true"
                ]);
            }

            return $response;
        }
        
        public function updateFavorito(Request $request, Response $response, array $args): Response 
        {
            $headers = $request->getHeaders();

            if(isset($headers['HTTP_TOKEN'])){
                $token = $headers['HTTP_TOKEN'][0];
                
                $autenticarDAO = new AutenticarDAO();
                $autenticarModel = new AutenticarModel();

                $autenticarModel->setToken($token);

                $tokenData = $autenticarDAO->findUserByToken($autenticarModel);

                if($tokenData && count($tokenData) > 0){
                    $data = $request->getParsedBody();

                    if($data && count($data) > 0){
                        $fieldsNecessary = ['estabelecimento_id', 'cliente_id'];
                        $data = Utilities::treatRequestBody($data, 'PDO');

                        $correctFieldsInformed = Utilities::verifyAmountFields($fieldsNecessary, $data);

                        if($correctFieldsInformed){
                            $clienteId = $tokenData[0]["id_usuario"];

                            $favoritoDAO = new FavoritoDAO();
                            $favoritoModel = new FavoritoModel();
                        
                            $favoritoModel->setEstabelecimentoId($data['estabelecimento_id']);
                            $favoritoModel->setClienteId($clienteId);
                        
                            $queryStatus = $enderecoDAO->updateFavorito($favoritoModel, $id);

                            if($queryStatus){
                                $response = $response->withJson([
                                    "message" => "Estabelecimento favoritado atualizado com sucesso",
                                    "error" => "false"
                                ]);
                            }
                            else{
                                $response = $response->withJson([
                                    "message" => "Erro ao atualizar o favorito",
                                    "error" => "true"
                                ]);
                            }
                        }
                        else{
                            $response = $response->withJson([
                                "message" => "Informe todos os campos necessários para a atualização",
                                "error" => "true"
                            ]);
                        }
                    }
                    else{
                        $response = $response->withJson([
                            "message" => "Informe o campos a serem atualizados",
                            "error" => "true"
                        ]);
                    }
                }
                else{
                    $response = $response->withJson([
                        "message" => "Token inválido",
                        "error" => "true"
                    ]);
                }
            }
            else{
                $response = $response->withJson([
                    "message" => "Informe o token do usuário logado",
                    "error" => "true"
                ]);
            }

            return $response;
        }
        
        public function deleteFavorito(Request $request, Response $response, array $args): Response 
        {
            $data = $request->getParsedBody();

            if($data && count($data) > 0){
                $fieldsNecessary = ['estabelecimento_id'];
                $data = Utilities::treatRequestBody($data, 'PDO');

                $correctFieldsInformed = Utilities::verifyAmountFields($fieldsNecessary, $data);

                if($correctFieldsInformed){
                    $estabelecimentoId = $data['estabelecimento_id'];

                    if(is_numeric($estabelecimentoId)){
                        $favoritoDAO = new FavoritoDAO();
                        $queryStatus = $favoritoDAO->deleteFavorito($estabelecimentoId);
        
                        if($queryStatus){
                            $response = $response->withJson([
                                "message" => "Favorito deletado com sucesso",
                                "error" => "false"
                            ]);
                        }
                        else{
                            $response = $response->withJson([
                                "message" => "Erro ao deletar o favoritado",
                                "error" => "true"
                            ]);
                        }
                    }
                    else{
                        $response = $response->withJson([
                            "message" => "Informe um id númerico",
                            "error" => "true"
                        ]);
                    }
                }
                else{
                    $response = $response->withJson([
                        "message" => "Informe o id a ser deletado",
                        "error" => "true"
                    ]);
                }
            }
            else{
                $response = $response->withJson([
                    "message" => "Informe o id a ser deletado",
                    "error" => "true"
                ]);
            }
            
            return $response;
        }
    }