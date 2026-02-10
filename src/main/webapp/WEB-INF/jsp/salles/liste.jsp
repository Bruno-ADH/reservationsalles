<%@ include file="../header.jsp" %>

<div class="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4 mb-8">
    <h1 class="text-2xl sm:text-3xl font-bold text-white neon-text-cyan">
        <i class="fa-solid fa-door-open mr-3"></i>Salles
    </h1>
    <a href="/salles/nouveau" class="btn-neon text-violet-300 px-5 py-2.5 rounded-xl font-medium text-center">
        <i class="fa-solid fa-circle-plus mr-2"></i>Ajouter une salle
    </a>
</div>

<c:choose>
    <c:when test="${empty salles}">
        <div class="glass rounded-2xl neon-cyan p-10 sm:p-16 text-center">
            <i class="fa-solid fa-building-circle-xmark text-5xl text-cyan-400/50 mb-5"></i>
            <p class="text-gray-400 text-lg mb-6">Aucune salle enregistree pour le moment.</p>
            <a href="/salles/nouveau" class="btn-neon text-violet-300 px-6 py-3 rounded-xl font-medium inline-block">
                <i class="fa-solid fa-circle-plus mr-2"></i>Ajouter la premiere salle
            </a>
        </div>
    </c:when>
    <c:otherwise>
        <!-- Desktop table -->
        <div class="hidden md:block glass rounded-2xl neon-cyan overflow-hidden">
            <table class="min-w-full">
                <thead>
                    <tr class="border-b border-white/10">
                        <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Nom</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Capacite</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Localisation</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Disponible</th>
                        <th class="px-6 py-4 text-center text-xs font-semibold text-cyan-300 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${salles}">
                        <tr class="border-b border-white/5 table-row transition duration-200">
                            <td class="px-6 py-4 text-sm text-gray-300">${s.id}</td>
                            <td class="px-6 py-4 text-sm text-gray-200 font-medium">
                                <i class="fa-solid fa-door-open text-cyan-400/60 mr-2"></i>${s.nom}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-300">
                                <i class="fa-solid fa-users text-cyan-400/40 mr-2"></i>${s.capacite} pers.
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-300">
                                <i class="fa-solid fa-location-dot text-cyan-400/40 mr-2"></i>${s.localisation}
                            </td>
                            <td class="px-6 py-4 text-sm">
                                <c:choose>
                                    <c:when test="${s.disponible}">
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium"
                                              style="background: rgba(74, 222, 128, 0.15); border: 1px solid rgba(74, 222, 128, 0.3); color: #4ade80; text-shadow: 0 0 8px rgba(74, 222, 128, 0.5);">
                                            <i class="fa-solid fa-circle-check mr-1.5"></i>Disponible
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium"
                                              style="background: rgba(248, 113, 113, 0.15); border: 1px solid rgba(248, 113, 113, 0.3); color: #f87171; text-shadow: 0 0 8px rgba(248, 113, 113, 0.5);">
                                            <i class="fa-solid fa-circle-xmark mr-1.5"></i>Indisponible
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="px-6 py-4 text-sm text-center">
                                <div class="flex justify-center space-x-2">
                                    <a href="/salles/modifier/${s.id}" data-tooltip="Modifier"
                                       class="btn-icon-edit text-cyan-400 px-3 py-2 rounded-lg inline-block">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="/salles/supprimer/${s.id}" data-tooltip="Supprimer"
                                       class="btn-neon-red text-red-400 px-3 py-2 rounded-lg inline-block"
                                       onclick="return confirm('Supprimer cette salle ?')">
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
            <c:forEach var="s" items="${salles}">
                <div class="glass rounded-2xl neon-cyan p-5">
                    <div class="flex justify-between items-start mb-3">
                        <h3 class="text-lg font-semibold text-gray-200">
                            <i class="fa-solid fa-door-open text-cyan-400/60 mr-2"></i>${s.nom}
                        </h3>
                        <span class="text-xs text-gray-500">#${s.id}</span>
                    </div>
                    <p class="text-sm text-gray-400 mb-1">
                        <i class="fa-solid fa-users text-cyan-400/40 mr-2"></i>${s.capacite} personnes
                    </p>
                    <p class="text-sm text-gray-400 mb-2">
                        <i class="fa-solid fa-location-dot text-cyan-400/40 mr-2"></i>${s.localisation}
                    </p>
                    <div class="mb-4">
                        <c:choose>
                            <c:when test="${s.disponible}">
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium"
                                      style="background: rgba(74, 222, 128, 0.15); border: 1px solid rgba(74, 222, 128, 0.3); color: #4ade80; text-shadow: 0 0 8px rgba(74, 222, 128, 0.5);">
                                    <i class="fa-solid fa-circle-check mr-1.5"></i>Disponible
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium"
                                      style="background: rgba(248, 113, 113, 0.15); border: 1px solid rgba(248, 113, 113, 0.3); color: #f87171; text-shadow: 0 0 8px rgba(248, 113, 113, 0.5);">
                                    <i class="fa-solid fa-circle-xmark mr-1.5"></i>Indisponible
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="flex space-x-2">
                        <a href="/salles/modifier/${s.id}"
                           class="btn-icon-edit text-cyan-400 px-4 py-2 rounded-lg text-sm flex-1 text-center">
                            <i class="fa-solid fa-pen-to-square mr-1.5"></i>Modifier
                        </a>
                        <a href="/salles/supprimer/${s.id}"
                           class="btn-neon-red text-red-400 px-4 py-2 rounded-lg text-sm flex-1 text-center"
                           onclick="return confirm('Supprimer cette salle ?')">
                            <i class="fa-solid fa-trash mr-1.5"></i>Supprimer
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

<%@ include file="../footer.jsp" %>
