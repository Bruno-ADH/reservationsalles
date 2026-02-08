<%@ include file="../header.jsp" %>

<div class="max-w-lg mx-auto">
    <h1 class="text-3xl font-bold text-white neon-text-cyan mb-8">
        ${salle.id != null ? 'Modifier' : 'Ajouter'} une Salle
    </h1>

    <form action="/salles/save" method="post" class="glass rounded-2xl neon-cyan p-8 space-y-5">
        <c:if test="${salle.id != null}">
            <input type="hidden" name="id" value="${salle.id}" />
        </c:if>

        <div>
            <label class="block text-sm font-medium text-cyan-300 mb-2">Nom</label>
            <input type="text" name="nom" value="${salle.nom}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div>
            <label class="block text-sm font-medium text-cyan-300 mb-2">Capacite</label>
            <input type="number" name="capacite" value="${salle.capacite}" required min="1"
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div>
            <label class="block text-sm font-medium text-cyan-300 mb-2">Localisation</label>
            <input type="text" name="localisation" value="${salle.localisation}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div class="flex items-center space-x-3">
            <input type="checkbox" name="disponible" value="true" ${salle.disponible ? 'checked' : ''}
                   class="h-5 w-5 rounded" />
            <label class="text-sm font-medium text-cyan-300">Disponible</label>
        </div>

        <div class="flex space-x-4 pt-4">
            <button type="submit" class="btn-neon text-violet-300 px-8 py-3 rounded-xl font-medium">
                Enregistrer
            </button>
            <a href="/salles/liste" class="btn-neon-gray text-gray-300 px-8 py-3 rounded-xl font-medium">
                Annuler
            </a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
