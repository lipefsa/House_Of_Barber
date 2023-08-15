const apiPath = "/house_of_barber/api";

const mountAllFavoriteButtons = () => {
    const favoriteButtons = document.querySelectorAll('.favorite-button');

    favoriteButtons.forEach(favoriteButton => {
        const dataFavoriteEstablishment = favoriteButton.getAttribute('data-favorite-establishment');
        const isFavoriteEstablishment = dataFavoriteEstablishment === 'true';

        if (isFavoriteEstablishment) {
            const icon = favoriteButton.children[0]; 
            icon.classList.remove('fa-star-o');
            icon.classList.add('fa-star');
            favoriteButton.classList.add('favorite-button--on');
        }

        favoriteButton.addEventListener('click', function(e) {
            e.preventDefault();
            const icon = this.children[0]; 
            const establishmentId = this.getAttribute('data-favorite-id');
            
            icon.classList.toggle('fa-star-o');
            icon.classList.toggle('fa-star');
            this.classList.toggle('favorite-button--on');

            handleFavorite(establishmentId);
        })
    });
};

const handleFavorite = (establishmentId) => {
    const token = Cookies.get('user_token');

    const headers = {
        'Content-Type': 'application/json',
        'token': token
    };

    const body = {
        estabelecimento_id: establishmentId,
    };

    request(`${apiPath}/favorito/${establishmentId}`, headers, 'GET', '', (data) => {
        if(data.length == 0) {
            loading();

            request(`${apiPath}/favorito`, headers, 'POST', body, (data) => {
                if(data.error == "false"){
                    closeLoading();
                    console.log('inseriu');
                }
                else{
                    msg("info", "Atenção", data.message);
                }
            });
        }
        else {
            loading();

            request(`${apiPath}/favorito`, headers, 'DELETE', body, (data) => {
                if(data.error == "false"){
                    closeLoading();
                }
                else{
                    msg("info", "Atenção", data.message);
                }
            });
        }
    });
};

const buildClienteArea = () =>{
    loading();

    const token = Cookies.get('user_token');

    const headers = {
        'Content-Type': 'application/json',
        'token': token
    };

    request(`${apiPath}/estabelecimentos/favoritos`, headers, 'GET', '', (data) => {
        const cardsBarbeariaWrapper = document.querySelector("#cards-barbearias");

        if(data.error == "true"){
            msgWithRedirect("error", "Ooops!", data.message, "/house_of_barber");
        }
        else{
            if(data && data.length > 0){
                data.forEach(establishment => {
                    const {
                        estabelecimento_id,
                        nome,
                        horario_abertura,
                        horario_fechamento,
                        telefone,
                        cidade,
                        status_funcionamento,
                        foto_perfil,
                        estabelecimento_favorito
                    } = establishment;

                    let horarioAberturaFormat = "";
                    let horarioFechamentoFormat = "";
                    let fotoPerfil;

                    if(horario_abertura == "FECHADO"){
                        horarioAberturaFormat = "Fechado"
                    }
                    else if(horario_abertura){
                        horarioAberturaFormat = `${horario_abertura}H - `;
                        horarioFechamentoFormat = `${horario_fechamento}H`;
                    }

                    if(foto_perfil == null || foto_perfil == ""){
                        fotoPerfil = `../assets/images/cliente-sem-ft.png`;
                    }
                    else{
                        fotoPerfil = `../uploads/barbearia/resized_${foto_perfil}`;
                    }

                    cardsBarbeariaWrapper.innerHTML += `
                        <div class='col-md-3 col-sm-12 mb-4'>
                            <div class='card area-favorito-card'>
                                <div class='area-favorito-card-header'>
                                    <img 
                                        class='card-img-top' 
                                        src='${fotoPerfil}' 
                                        alt='Imagem de capa do card'
                                    />
                                    <a 
                                        class="favorite-button" 
                                        href="#"
                                        data-favorite-id="${estabelecimento_id}"
                                        data-favorite-establishment="${estabelecimento_favorito}"
                                    >
                                        <span class="favorite-button-icon fa fa-star-o"></span>
                                    </a> 
                                    <div class='status-${status_funcionamento == "ABERTO" ? "aberto" : "fechado"} hb-txt-black hb-w-700'>
                                        ${status_funcionamento}
                                    </div>
                                </div>
                                <div class='card-body hb-txt-white'>
                                    <h5 class='card-title hb-w-700 hb-txt-secondary'>
                                        ${nome}
                                    </h5>
                                    <div class='card-text'>
                                        <p>
                                            <i class='fa fa-clock-o'></i>
                                            <span class='ml-1'>
                                                ${horarioAberturaFormat} 
                                                ${horarioFechamentoFormat}
                                            </span>
                                        </p>    
                                        <p>
                                            <i class='fa fa-phone'></i>
                                            <span class='ml-1'>${telefone}</span>
                                        </p>        
                                        <p>
                                            <i class='fa fa-map-marker'></i>
                                            <span class='ml-1'>${cidade}</span>
                                        </p>                                            
                                    </div>
                                    <a 
                                        href='/house_of_barber/barbearias/${estabelecimento_id}' 
                                        class='btn hb-btn-secondary hb-w-700 hb-full-width'
                                    >
                                        Agendar
                                    </a>
                                </div>
                            </div>
                        </div>
                    `;

                    mountAllFavoriteButtons();
                });

                closeLoading();
            }
            else {
                cardsBarbeariaWrapper.closest('#area-favorito').classList.add('area-favorito-no-content')
                cardsBarbeariaWrapper.innerHTML = `
                    <h2>Ainda não há favoritos</h2>
                `;

                closeLoading();
            }
        }
    });
};

buildClienteArea();

