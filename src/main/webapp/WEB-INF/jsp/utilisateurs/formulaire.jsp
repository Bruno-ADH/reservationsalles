<%@ include file="../header.jsp" %>

<div class="max-w-lg mx-auto">
    <h1 class="text-3xl font-bold text-white neon-text-cyan mb-8">
        ${utilisateur.id != null ? 'Modifier' : 'Ajouter'} un Utilisateur
    </h1>

    <form action="/utilisateurs/save" method="post" class="glass rounded-2xl neon-purple p-8 space-y-5">
        <c:if test="${utilisateur.id != null}">
            <input type="hidden" name="id" value="${utilisateur.id}" />
        </c:if>

        <div>
            <label class="block text-sm font-medium text-violet-300 mb-2">Nom</label>
            <input type="text" name="nom" value="${utilisateur.nom}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div>
            <label class="block text-sm font-medium text-violet-300 mb-2">Email</label>
            <input type="email" name="email" value="${utilisateur.email}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div>
            <label class="block text-sm font-medium text-violet-300 mb-2">Role</label>
            <input type="text" name="role" value="${utilisateur.role}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div class="flex space-x-4 pt-4">
            <button type="submit" class="btn-neon text-violet-300 px-8 py-3 rounded-xl font-medium">
                Enregistrer
            </button>
            <a href="/utilisateurs/liste" class="btn-neon-gray text-gray-300 px-8 py-3 rounded-xl font-medium">
                Annuler
            </a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
