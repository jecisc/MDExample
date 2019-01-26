Class {
	#name : #BaselineOfMDExample,
	#superclass : #BaselineOf,
	#category : #BaselineOfMDExample
}

{ #category : #baselines }
BaselineOfMDExample >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			self materialDesignLite: spec.

			"Packages"
			spec
				package: 'MDExample-Model';
				package: 'MDExample-Tests' with: [ spec requires: #('MDExample-Model') ];
				package: 'MDExample-WebApplication' with: [ spec requires: #('MDExample-Model' 'MaterialDesignLite') ].

			"Groups"
			spec
				group: 'Model' with: #('MDExample-Model');
				group: 'Web' with: #('MDExample-WebApplication');
				group: 'Tests' with: #('MDExample-Tests') ]
]

{ #category : #dependencies }
BaselineOfMDExample >> materialDesignLite: spec [
	spec baseline: 'MaterialDesignLite' with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #accessing }
BaselineOfMDExample >> projectClass [
	^ MetacelloCypressBaselineProject
]
