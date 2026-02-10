<%@ include file="../header.jsp" %>

<div class="max-w-xl mx-auto">
    <h1 class="text-2xl sm:text-3xl font-bold text-white neon-text-cyan mb-8">
        <c:choose>
            <c:when test="${reservation.id != null}">
                <i class="fa-solid fa-calendar-pen mr-3"></i>Modifier une Reservation
            </c:when>
            <c:otherwise>
                <i class="fa-solid fa-calendar-plus mr-3"></i>Nouvelle Reservation
            </c:otherwise>
        </c:choose>
    </h1>

    <c:if test="${not empty erreur}">
        <div class="mb-6 p-4 rounded-xl flex items-center space-x-3"
             style="background: rgba(239, 68, 68, 0.15); border: 1px solid rgba(239, 68, 68, 0.4);">
            <i class="fa-solid fa-triangle-exclamation text-red-400 text-lg"></i>
            <span class="text-red-300 text-sm font-medium">${erreur}</span>
        </div>
    </c:if>

    <form action="/reservations/save" method="post" class="glass rounded-2xl neon-pink p-6 sm:p-8 space-y-5 sm:space-y-6">
        <c:if test="${reservation.id != null}">
            <input type="hidden" name="id" value="${reservation.id}" />
        </c:if>

        <div>
            <label class="flex items-center text-sm font-medium text-pink-300 mb-2">
                <i class="fa-solid fa-calendar-day mr-2 text-pink-400/60"></i>Date de reservation
            </label>
            <input type="date" name="dateReservation" value="${reservation.dateReservation}" required
                   class="w-full rounded-xl px-4 py-3 border" />
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <label class="flex items-center text-sm font-medium text-pink-300 mb-2">
                    <i class="fa-solid fa-clock mr-2 text-pink-400/60"></i>Heure de debut
                </label>
                <input type="time" name="heureDebut" value="${reservation.heureDebut}" required
                       class="w-full rounded-xl px-4 py-3 border" />
            </div>
            <div>
                <label class="flex items-center text-sm font-medium text-pink-300 mb-2">
                    <i class="fa-solid fa-clock mr-2 text-pink-400/60"></i>Heure de fin
                </label>
                <input type="time" name="heureFin" value="${reservation.heureFin}" required
                       class="w-full rounded-xl px-4 py-3 border" />
            </div>
        </div>

        <div>
            <label class="flex items-center text-sm font-medium text-pink-300 mb-2">
                <i class="fa-solid fa-user mr-2 text-pink-400/60"></i>Utilisateur
            </label>
            <select name="utilisateurId" required class="w-full rounded-xl px-4 py-3 border">
                <option value="">-- Choisir un utilisateur --</option>
                <c:forEach var="u" items="${utilisateurs}">
                    <option value="${u.id}" ${reservation.utilisateur != null && reservation.utilisateur.id == u.id ? 'selected' : ''}>
                        ${u.nom}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div>
            <label class="flex items-center text-sm font-medium text-pink-300 mb-2">
                <i class="fa-solid fa-door-open mr-2 text-pink-400/60"></i>Salle
            </label>
            <select name="salleId" required class="w-full rounded-xl px-4 py-3 border">
                <option value="">-- Choisir une salle --</option>
                <c:forEach var="s" items="${salles}">
                    <option value="${s.id}" ${reservation.salle != null && reservation.salle.id == s.id ? 'selected' : ''}>
                        ${s.nom}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="flex flex-col sm:flex-row space-y-3 sm:space-y-0 sm:space-x-4 pt-4">
            <button type="submit" class="btn-neon text-violet-300 px-8 py-3 rounded-xl font-medium">
                <i class="fa-solid fa-floppy-disk mr-2"></i>Enregistrer
            </button>
            <a href="/reservations/liste" class="btn-neon-gray text-gray-300 px-8 py-3 rounded-xl font-medium text-center">
                <i class="fa-solid fa-xmark mr-2"></i>Annuler
            </a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
