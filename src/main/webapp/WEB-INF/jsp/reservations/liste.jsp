<%@ include file="../header.jsp" %>

<div class="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4 mb-8">
    <h1 class="text-2xl sm:text-3xl font-bold text-white neon-text-cyan">
        <i class="fa-solid fa-calendar-check mr-3"></i>Reservations
    </h1>
    <a href="/reservations/nouveau" class="btn-neon text-violet-300 px-5 py-2.5 rounded-xl font-medium text-center">
        <i class="fa-solid fa-calendar-plus mr-2"></i>Nouvelle reservation
    </a>
</div>

<c:choose>
    <c:when test="${empty reservations}">
        <div class="glass rounded-2xl neon-pink p-10 sm:p-16 text-center">
            <i class="fa-solid fa-calendar-xmark text-5xl text-pink-400/50 mb-5"></i>
            <p class="text-gray-400 text-lg mb-6">Aucune reservation enregistree pour le moment.</p>
            <a href="/reservations/nouveau" class="btn-neon text-violet-300 px-6 py-3 rounded-xl font-medium inline-block">
                <i class="fa-solid fa-calendar-plus mr-2"></i>Creer la premiere reservation
            </a>
        </div>
    </c:when>
    <c:otherwise>
        <!-- Desktop table -->
        <div class="hidden md:block glass rounded-2xl neon-pink overflow-hidden">
            <table class="min-w-full">
                <thead>
                    <tr class="border-b border-white/10">
                        <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Date</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Horaire</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Utilisateur</th>
                        <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Salle</th>
                        <th class="px-6 py-4 text-center text-xs font-semibold text-pink-300 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="r" items="${reservations}">
                        <tr class="border-b border-white/5 table-row transition duration-200">
                            <td class="px-6 py-4 text-sm text-gray-300">${r.id}</td>
                            <td class="px-6 py-4 text-sm text-gray-200 font-medium">
                                <i class="fa-solid fa-calendar-day text-pink-400/60 mr-2"></i>${r.dateReservation}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-300">
                                <i class="fa-solid fa-clock text-pink-400/40 mr-1.5"></i>${r.heureDebut} - ${r.heureFin}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-300">
                                <i class="fa-solid fa-user text-pink-400/40 mr-2"></i>${r.utilisateur.nom}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-300">
                                <i class="fa-solid fa-door-open text-pink-400/40 mr-2"></i>${r.salle.nom}
                            </td>
                            <td class="px-6 py-4 text-sm text-center">
                                <div class="flex justify-center space-x-2">
                                    <a href="/reservations/modifier/${r.id}" data-tooltip="Modifier"
                                       class="btn-icon-edit text-cyan-400 px-3 py-2 rounded-lg inline-block">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="/reservations/supprimer/${r.id}" data-tooltip="Supprimer"
                                       class="btn-neon-red text-red-400 px-3 py-2 rounded-lg inline-block"
                                       onclick="return confirm('Supprimer cette reservation ?')">
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
            <c:forEach var="r" items="${reservations}">
                <div class="glass rounded-2xl neon-pink p-5">
                    <div class="flex justify-between items-start mb-3">
                        <h3 class="text-lg font-semibold text-gray-200">
                            <i class="fa-solid fa-calendar-day text-pink-400/60 mr-2"></i>${r.dateReservation}
                        </h3>
                        <span class="text-xs text-gray-500">#${r.id}</span>
                    </div>
                    <p class="text-sm text-gray-400 mb-1">
                        <i class="fa-solid fa-clock text-pink-400/40 mr-2"></i>${r.heureDebut} - ${r.heureFin}
                    </p>
                    <p class="text-sm text-gray-400 mb-1">
                        <i class="fa-solid fa-user text-pink-400/40 mr-2"></i>${r.utilisateur.nom}
                    </p>
                    <p class="text-sm text-gray-400 mb-4">
                        <i class="fa-solid fa-door-open text-pink-400/40 mr-2"></i>${r.salle.nom}
                    </p>
                    <div class="flex space-x-2">
                        <a href="/reservations/modifier/${r.id}"
                           class="btn-icon-edit text-cyan-400 px-4 py-2 rounded-lg text-sm flex-1 text-center">
                            <i class="fa-solid fa-pen-to-square mr-1.5"></i>Modifier
                        </a>
                        <a href="/reservations/supprimer/${r.id}"
                           class="btn-neon-red text-red-400 px-4 py-2 rounded-lg text-sm flex-1 text-center"
                           onclick="return confirm('Supprimer cette reservation ?')">
                            <i class="fa-solid fa-trash mr-1.5"></i>Supprimer
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

<%@ include file="../footer.jsp" %>
