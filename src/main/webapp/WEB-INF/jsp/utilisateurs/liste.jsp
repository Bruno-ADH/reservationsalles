<%@ include file="../header.jsp" %>

<div class="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4 mb-8">
    <h1 class="text-2xl sm:text-3xl font-bold text-white neon-text-cyan">
        <i class="fa-solid fa-users mr-3"></i>Utilisateurs
    </h1>
    <a href="/utilisateurs/nouveau" class="btn-neon text-violet-300 px-5 py-2.5 rounded-xl font-medium text-center">
        <i class="fa-solid fa-user-plus mr-2"></i>Ajouter un utilisateur
    </a>
</div>

<c:choose>
    <c:when test="${empty utilisateurs}">
        <div class="glass rounded-2xl neon-purple p-10 sm:p-16 text-center">
            <i class="fa-solid fa-user-slash text-5xl text-violet-400/50 mb-5"></i>
            <p class="text-gray-400 text-lg mb-6">Aucun utilisateur enregistre pour le moment.</p>
            <a href="/utilisateurs/nouveau" class="btn-neon text-violet-300 px-6 py-3 rounded-xl font-medium inline-block">
                <i class="fa-solid fa-user-plus mr-2"></i>Ajouter le premier utilisateur
            </a>
        </div>
    </c:when>
    <c:otherwise>
        <!-- Desktop table -->
        <div class="hidden md:block glass rounded-2xl neon-purple overflow-hidden">
            <table class="min-w-full">
                <thead>
                    <tr class="border-b border-white/10">
                        <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">Nom</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">Email</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">Role</th>
                        <th class="px-6 py-4 text-center text-xs font-semibold text-violet-300 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${utilisateurs}">
                        <tr class="border-b border-white/5 table-row transition duration-200">
                            <td class="px-6 py-4 text-sm text-gray-300">${u.id}</td>
                            <td class="px-6 py-4 text-sm text-gray-200 font-medium">
                                <i class="fa-solid fa-user text-violet-400/60 mr-2"></i>${u.nom}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-300">
                                <i class="fa-solid fa-envelope text-violet-400/40 mr-2"></i>${u.email}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-300">
                                <i class="fa-solid fa-id-badge text-violet-400/40 mr-2"></i>${u.role}
                            </td>
                            <td class="px-6 py-4 text-sm text-center">
                                <div class="flex justify-center space-x-2">
                                    <a href="/utilisateurs/modifier/${u.id}" data-tooltip="Modifier"
                                       class="btn-icon-edit text-cyan-400 px-3 py-2 rounded-lg inline-block">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="/utilisateurs/supprimer/${u.id}" data-tooltip="Supprimer"
                                       class="btn-neon-red text-red-400 px-3 py-2 rounded-lg inline-block"
                                       onclick="return confirm('Supprimer cet utilisateur ?')">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- Mobile cards -->
        <div class="md:hidden space-y-4">
            <c:forEach var="u" items="${utilisateurs}">
                <div class="glass rounded-2xl neon-purple p-5">
                    <div class="flex justify-between items-start mb-3">
                        <h3 class="text-lg font-semibold text-gray-200">
                            <i class="fa-solid fa-user text-violet-400/60 mr-2"></i>${u.nom}
                        </h3>
                        <span class="text-xs text-gray-500">#${u.id}</span>
                    </div>
                    <p class="text-sm text-gray-400 mb-1">
                        <i class="fa-solid fa-envelope text-violet-400/40 mr-2"></i>${u.email}
                    </p>
                    <p class="text-sm text-gray-400 mb-4">
                        <i class="fa-solid fa-id-badge text-violet-400/40 mr-2"></i>${u.role}
                    </p>
                    <div class="flex space-x-2">
                        <a href="/utilisateurs/modifier/${u.id}"
                           class="btn-icon-edit text-cyan-400 px-4 py-2 rounded-lg text-sm flex-1 text-center">
                            <i class="fa-solid fa-pen-to-square mr-1.5"></i>Modifier
                        </a>
                        <a href="/utilisateurs/supprimer/${u.id}"
                           class="btn-neon-red text-red-400 px-4 py-2 rounded-lg text-sm flex-1 text-center"
                           onclick="return confirm('Supprimer cet utilisateur ?')">
                            <i class="fa-solid fa-trash mr-1.5"></i>Supprimer
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

<%@ include file="../footer.jsp" %>
