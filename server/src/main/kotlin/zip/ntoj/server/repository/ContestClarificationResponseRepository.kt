package zip.ntoj.server.repository

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.JpaSpecificationExecutor
import zip.ntoj.server.model.ContestClarificationResponse

interface ContestClarificationResponseRepository :
    JpaRepository<ContestClarificationResponse, Long>,
    JpaSpecificationExecutor<ContestClarificationResponse>
