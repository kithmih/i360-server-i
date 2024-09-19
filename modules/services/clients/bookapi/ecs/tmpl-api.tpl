[  
	{ 
		"logConfiguration": {
			"logDriver": "awslogs",
			"options": {
				"awslogs-group": "${log_group}",
				"awslogs-region": "ap-south-1",
				"awslogs-stream-prefix": "ecs"
			}
		},
		"portMappings": [
			{
				"hostPort": 3000,
				"protocol": "tcp",
				"containerPort": 3000
			}
		],
		"cpu": 0,
		"environment": [
			{
				"name": "CONFIG_PROFILE",
				"value": "${lower(CONFIG_PROFILE)}"
			},
			{
				"name": "REGION",
				"value": "${REGION}"
			},
			{
				"name": "ACCESS_KEY_ID",
				"value": "${ACCESS_KEY_ID}"
			},
			{
				"name": "SECRET_ACCESS_KEY",
				"value": "${SECRET_ACCESS_KEY}"
			},
			{
				"name": "NODE_ENV",
				"value": "production"
			}, 
			{
				"name": "PORT",
				"value": "3000"
			}
		],
		"image": "${docker_image}",
		"healthCheck": {
			"retries": 3,
			"command": [
				"CMD-SHELL",
				"curl -f http://localhost:3000/health || exit 1"
			],
			"timeout": 60,
			"interval": 20,
			"startPeriod": 120
		},
		"dockerLabels": {
			"environment": "${env}",
			"client": "house",
			"project": "bookapi", 
			"service" : "${service}"
		},
		"name": "${service}",
        "user" : "0"
	}
]