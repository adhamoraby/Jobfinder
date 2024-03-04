abstract class ApplyStates {}

class SuperApplyStates extends ApplyStates {}

//  Token Emits
class GettingTokenSuccessfully extends SuperApplyStates {}

class GettingTokenFailed extends SuperApplyStates {}

class GettingAllJobsSuccessfully extends SuperApplyStates {}

class GettingAllJobsFailed extends SuperApplyStates {}

class GettingJobByIdSuccessfully extends SuperApplyStates {}

class GettingJobByIdFailed extends SuperApplyStates {}
