<?php 
   namespace App\Models\MySQL\HouseOfBarber;

   class FavoritoModel{
      private $id;
      private $estabelecimentoId;
      private $clienteId;

      /**
       * Get the value of id
       */
      public function getId()
      {
         return $this->id;
      }

      /**
       * Get the value of estabelecimentoId
       */
      public function getEstabelecimentoId()
      {
         return $this->estabelecimentoId;
      }

      /**
       * Get the value of clienteId
       */
      public function getClienteId()
      {
         return $this->clienteId;
      }

      /**
       * Set the value of id
       */
      public function setId($id): self
      {
         $this->id = $id;

         return $this;
      }

       /**
       * Set the value of estabelecimentoId
       */
      public function setEstabelecimentoId($estabelecimentoId): self
      {
         $this->estabelecimentoId = $estabelecimentoId;

         return $this;
      }

      /**
       * Set the value of clienteId
       */
      public function setClienteId($clienteId): self
      {
         $this->clienteId = $clienteId;

         return $this;
      }
   }