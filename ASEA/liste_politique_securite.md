# Liste des politiques de sécurité appliquées dans les compte de travail ASEA

## EC2

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| EC2-INSTANCE-PROFILE | Les instances EC2 doivent être attachées au profil IAM `EC2-Default-SSM-AD-Role-ip` |  Automatisé | AWS Config |
| EC2-INSTANCE-PROFILE-PERMISSIONS | Les instances EC2 doivent être attachés au politiques IAM suivantes: `AmazonSSMManagedInstanceCore`, `AmazonSSMDirectoryServiceAccess`,  `CloudWatchAgentServerPolicy` |  Automatisé | AWS Config |
| EC2-INSTANCE-PROFILE-PERMISSIONS | Les instances EC2 doivent être attachés au politiques IAM suivantes: `AmazonSSMManagedInstanceCore`, `AmazonSSMDirectoryServiceAccess`,  `CloudWatchAgentServerPolicy` |  Automatisé | AWS Config |
| EC2_INSTANCE_DETAILED_MONITORING_ENABLED | Vérifie si la surveillance détaillée est activée pour les instances EC2.  | Alerte conformité | AWS Config |
| EC2_MANAGEDINSTANCE_PATCH_COMPLIANCE_STATUS_CHECK | Vérifie si l'état de conformité des correctifs *Systems Manager* après l'installation d'un correctif sur l'instance. | Alerte conformité | AWS Config |
| INSTANCES_IN_VPC | Vérifie que vos instances EC2 appartiennent à un réseau Virtual Private (VPC). | AWS Config |

## EBS/EFS (Volumes EC2)

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| EBS1 | Le volume d'une instance EC2 doit être encrypté lors du déploiement de l'instance. | Erreur | Organization |
| EBS2 | Le volume d'une instance EC2 doit être encrypté lors de sa création. | Erreur | Organization |
| EFS | Le volume EFS doit être encrypté lors de sa création. | Erreur | Organization |
| EBS_IN_BACKUP_PLAN | Vérifie si les volumes Amazon Elastic Block Store (Amazon EBS) sont dans un plan de sauvegarde AWS Backup. | Alerte conformité | AWS Config |
| EC2_VOLUME_INUSE_CHECK | Vérifie si les volumes EBS sont attachés à des instances EC2. Vérifie éventuellement si les volumes EBS sont marqués pour suppression lorsqu'une instance est mise hors service. | Alerte conformité | AWS Config |

## ELB / ALB

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| ELB_LOGGING_ENABLED | Les ELB doivent activer la journalisation et déposer les journaux dans un bucket S3 du compte `LogArchive` |  Automatisé | AWS Config |
| ALB_WAF_ENABLED | Vérifie si le Web Application Firewall (WAF) est activé sur les équilibreurs de charge d'application (ALB) | Alerte conformité | AWS Config |
| ELB_ACM_CERTIFICATE_REQUIRED | Vérifie si les Classic Load Balancers utilisent des certificats SSL fournis par Certificate Manager. | Alerte conformité | AWS Config |
| ELB_CROSS_ZONE_LOAD_BALANCING_ENABLED | Vérifie si l'équilibrage de charge entre zones est activé pour les Classic Load Balancers. | Alerte conformité | AWS Config |
| WAFV2_LOGGING_ENABLED | Vérifie si la journalisation est activée les ACL régionaux et mondiaux du Web Application Firewall (WAFV2). | Alerte conformité | AWS Config |

## RDS

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| RDS | Le stockage d'une base de données RDS doit être encrypté lors de sa création. | Erreur | Organization |
| AUR | Le stockage d'un cluster de bases de données RDS doit être encrypté lors de sa création. | Erreur | Organization |
| DB_INSTANCE_BACKUP_ENABLED | Vérifie si les sauvegardes sont activées pour les instances RDS DB. Le cas échéant, la règle vérifie la période de conservation des sauvegardes et la fenêtre de sauvegarde. | Alerte conformité | AWS Config |
| RDS_IN_BACKUP_PLAN | Vérifie si la base de données Amazon RDS est présente dans les plans de AWS Backup. | Alerte conformité | AWS Config |
| REDSHIFT_CLUSTER_CONFIGURATION_CHECK | Vérifie si des clusters Amazon Redshift sont cryptés et que la journalisation est activée. | Alerte conformité | AWS Config |

## S3

| S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED | Les bucket S3 doivent être encryptés. | Automatisée| AWS Config |
| S3_BUCKET_POLICY_GRANTEE_CHECK | Vérifie que l'accès accordé au compartiment S3 est limité par l'un des mécanismes suivants: par utilisateurs fédérés, par mandataires de service, par adresses IP ou par VPC que vous fournissez. | AWS Config |
| S3_BUCKET_VERSIONING_ENABLED | Vérifie si le versionnage est activé pour vos compartiments S3. | AWS Config |

## ACM

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| ACM_CERTIFICATE_EXPIRATION_CHECK | Les certificats ACM doivent être renouvelés avant 90 jours de leur date d'expiration. | Alerte conformité | AWS Config |

## API Gateway

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| API_GW_CACHE_ENABLED_AND_ENCRYPTED | Vérifie que le cache est activé et chiffré pour toutes les méthodes des étapes Amazon API Gateway. | Alerte conformité | AWS Config |

## VPC

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| INCOMING_SSH_DISABLED | Vérifie que le trafic SSH entrant pour les groupes de sécurité est accessible. La règle est COMPLIANT lorsque les adresses IP du trafic SSH entrant dans les groupes de sécurité sont limitées (CIDR différent de 0.0.0.0/0). | Alerte conformité | AWS Config |
| INTERNET_GATEWAY_AUTHORIZED_VPC_ONLY | Vérifie que les passerelles Internet sont uniquement attachées à un VPC autorisé. | Alerte conformité | AWS Config |
| RESTRICTED_INCOMING_TRAFFIC | Vérifie que les groupes de sécurité en cours d'utilisation interdisent le trafic TCP entrant illimité vers les ports spécifiés: 20, 21, 3389, 3306, 4333. | Alerte conformité | AWS Config |
| VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS | Vérifie que les groupes de sécurité autorise le traffic public (0.0.0.0/0) seulement sur les ports entrants suivants: TCP443, UDP1020-1025.  | Alerte conformité | AWS Config |

## Cloudtrail / Cloudwatch

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| CLOUD_TRAIL_ENABLED | Vérifie si CloudTrail est activé dans le compte | Alerte conformité | AWS Config |
| CLOUDTRAIL_S3_DATAEVENTS_ENABLED | Vérifie si au moins un suivi CloudTrail consigne les événements de données Amazon S3 pour tous les compartiments S3  | Alerte conformité | AWS Config |
| CLOUDTRAIL_SECURITY_TRAIL_ENABLED | Vérifie qu'il existe au moins un suivi CloudTrail défini avec les bonnes pratiques de sécurité.  | Alerte conformité | AWS Config |
| CLOUDWATCH_ALARM_ACTION_CHECK | Vérifie si les alarmes CloudWatch ont au moins une action d'alarme activée. | Alerte conformité | AWS Config |
| CW_LOGGROUP_RETENTION_PERIOD_CHECK | Vérifie si les LogGroup CloudWatch ont une période de conservation définie sur un nombre de jours spécifique. | Alerte conformité | AWS Config |

## DynamoDB

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| DYNAMODB_IN_BACKUP_PLAN | Vérifie si la table DynamoDB est présente dans un plan AWS Backup. | Alerte conformité | AWS Config |
| DYNAMODB_TABLE_ENCRYPTED_KMS | Vérifie si la table DynamoDB est chiffrée avec le service de gestion de clés (KMS).  | Alerte conformité | AWS Config |

## ElastiCache

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| ELASTICACHE_REDIS_CLUSTER_AUTOMATIC_BACKUP_CHECK | Vérifiez si la sauvegarde automatique des clusters Redis est activée dans ElastiCache. | Alerte conformité | AWS Config |

## IAM

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| IAM_GROUP_HAS_USERS_CHECK | Vérifie si les groupes IAM ont au moins un utilisateur IAM. | Alerte conformité | AWS Config |
| IAM_PASSWORD_POLICY | Vérifie si la stratégie de mot de passe du compte pour les utilisateurs IAM répond aux exigences spécifiées dans les paramètres: `"MaxPasswordAge": "90", "MinimumPasswordLength": "14", "PasswordReusePrevention": "24", "RequireLowercaseCharacters": "TRUE", "RequireNumbers": "TRUE", "RequireSymbols": "TRUE", "RequireUppercaseCharacters": "TRUE"` | Alerte conformité | AWS Config |
| IAM_USER_GROUP_MEMBERSHIP_CHECK | Vérifie si les utilisateurs IAM appartiennent à au moins un groupe IAM.  | Alerte conformité | AWS Config |

## Autres

| Règle | Explication | Méthode d'application | Service AWS |
| ----- | ----------- | --------------------- | ----------- |
| EMR_KERBEROS_ENABLED | Vérifie que Kerberos est activé dans les clusters Amazon EMR. | Alerte conformité | AWS Config |
| GUARDDUTY_NON_ARCHIVED_FINDINGS | Vérifie si Amazon GuardDuty contient des résultats qui ne sont pas archivés depuis plus de 30 jours. | Alerte conformité | AWS Config |
| SAGEMAKER_ENDPOINT_CONFIGURATION_KMS_KEY_CONFIGURED | Vérifie si une clé KMS est configurée pour un point de terminaison SageMaker. | Alerte conformité | AWS Config |
| SAGEMAKER_NOTEBOOK_INSTANCE_KMS_KEY_CONFIGURED | Vérifie si une clé KMS est configurée pour un bloc-note SageMaker. | Alerte conformité | AWS Config |
| SECURITYHUB_ENABLED | Vérifie que Security Hub est activé dans un compte. | Alerte conformité | AWS Config |
