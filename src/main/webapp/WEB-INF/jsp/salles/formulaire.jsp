<%@ include file="../header.jsp" %>

<div class="max-w-xl mx-auto">
    <h1 class="text-2xl sm:text-3xl font-bold text-white neon-text-cyan mb-8">
        <c:choose>
            <c:when test="${salle.id != null}">
                <i class="fa-solid fa-pen-to-square mr-3"></i>Modifier une Salle
            </c:when>
            <c:otherwise>
                <i class="fa-solid fa-circle-plus mr-3"></i>Ajouter une Salle
            </c:otherwise>
        </c:choose>
    </h1>

    <form action="/salles/save" method="post" class="glass rounded-2xl neon-cyan p-6 sm:p-8 space-y-5 sm:space-y-6">
        <c:if test="${salle.id != null}">
            <input type="hidden" name="id" value="${salle.id}" />
        </c:if>

        <div>
            <label class="flex items-center text-sm font-medium text-cyan-300 mb-2">
                <i class="fa-solid fa-door-open mr-2 text-cyan-400/60"></i>Nom de la salle
            </label>
            <input type="text" name="nom" value="${salle.nom}" required
                   placeholder="Ex: Salle Royale, Espace Diamant..."
                   class="w-full rounded-xl px-4 py-3 border" />
        </div>

        <div>
            <label class="flex items-center text-sm font-medium text-cyan-300 mb-2">
                <i class="fa-solid fa-users mr-2 text-cyan-400/60"></i>Capacite (nombre de personnes)
            </label>
            <input type="number" name="capacite" value="${salle.capacite}" required min="1"
                   placeholder="Ex: 100"
                   class="w-full rounded-xl px-4 py-3 border" />
        </div>

        <div>
            <label class="flex items-center text-sm font-medium text-cyan-300 mb-2">
                <i class="fa-solid fa-location-dot mr-2 text-cyan-400/60"></i>Localisation
            </label>
            <input type="text" name="localisation" value="${salle.localisation}" required
                   placeholder="Ex: Cotonou, Quartier Ganhi"
                   class="w-full rounded-xl px-4 py-3 border" />
        </div>

        <div class="flex items-center space-x-3 glass rounded-xl p-4">
            <input type="checkbox" name="disponible" value="true" ${salle.disponible ? 'checked' : ''}
                   class="h-5 w-5 rounded" />
            <label class="text-sm font-medium text-cyan-300">
                <i class="fa-solid fa-circle-check mr-1.5"></i>Salle disponible a la reservation
            </label>
        </div>

        <div class="flex flex-col sm:flex-row space-y-3 sm:space-y-0 sm:space-x-4 pt-4">
            <button type="submit" class="btn-neon text-violet-300 px-8 py-3 rounded-xl font-medium">
                <i class="fa-solid fa-floppy-disk mr-2"></i>Enregistrer
            </button>
            <a href="/salles/liste" class="btn-neon-gray text-gray-300 px-8 py-3 rounded-xl font-medium text-center">
                <i class="fa-solid fa-xmark mr-2"></i>Annuler
            </a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
