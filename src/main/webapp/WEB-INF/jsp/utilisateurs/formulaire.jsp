<%@ include file="../header.jsp" %>

<div class="max-w-xl mx-auto">
    <h1 class="text-2xl sm:text-3xl font-bold text-white neon-text-cyan mb-8">
        <c:choose>
            <c:when test="${utilisateur.id != null}">
                <i class="fa-solid fa-user-pen mr-3"></i>Modifier un Utilisateur
            </c:when>
            <c:otherwise>
                <i class="fa-solid fa-user-plus mr-3"></i>Ajouter un Utilisateur
            </c:otherwise>
        </c:choose>
    </h1>

    <form action="/utilisateurs/save" method="post" class="glass rounded-2xl neon-purple p-6 sm:p-8 space-y-5 sm:space-y-6">
        <c:if test="${utilisateur.id != null}">
            <input type="hidden" name="id" value="${utilisateur.id}" />
        </c:if>

        <div>
            <label class="flex items-center text-sm font-medium text-violet-300 mb-2">
                <i class="fa-solid fa-user mr-2 text-violet-400/60"></i>Nom
            </label>
            <input type="text" name="nom" value="${utilisateur.nom}" required
                   placeholder="Entrez le nom complet"
                   class="w-full rounded-xl px-4 py-3 border" />
        </div>

        <div>
            <label class="flex items-center text-sm font-medium text-violet-300 mb-2">
                <i class="fa-solid fa-envelope mr-2 text-violet-400/60"></i>Email
            </label>
            <input type="email" name="email" value="${utilisateur.email}" required
                   placeholder="exemple@email.com"
                   class="w-full rounded-xl px-4 py-3 border" />
        </div>

        <div>
            <label class="flex items-center text-sm font-medium text-violet-300 mb-2">
                <i class="fa-solid fa-id-badge mr-2 text-violet-400/60"></i>Role
            </label>
            <input type="text" name="role" value="${utilisateur.role}" required
                   placeholder="Ex: Organisateur, Client..."
                   class="w-full rounded-xl px-4 py-3 border" />
        </div>

        <div class="flex flex-col sm:flex-row space-y-3 sm:space-y-0 sm:space-x-4 pt-4">
            <button type="submit" class="btn-neon text-violet-300 px-8 py-3 rounded-xl font-medium">
                <i class="fa-solid fa-floppy-disk mr-2"></i>Enregistrer
            </button>
            <a href="/utilisateurs/liste" class="btn-neon-gray text-gray-300 px-8 py-3 rounded-xl font-medium text-center">
                <i class="fa-solid fa-xmark mr-2"></i>Annuler
            </a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
