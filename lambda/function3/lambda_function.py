import boto3
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    
    try:
        # Extract volume ID from the event
        volume_id = event['detail']['responseElements']['volumeId']
        logger.info(f"Processing volume: {volume_id}")
        
        # Describe the volume to get its type
        volume = ec2.describe_volumes(VolumeIds=[volume_id])['Volumes'][0]
        volume_type = volume['VolumeType']
        
        # If the volume is gp2, modify it to gp3
        if volume_type == 'gp2':
            ec2.modify_volume(VolumeId=volume_id, VolumeType='gp3')
            logger.info(f"Volume {volume_id} converted from gp2 to gp3.")
        else:
            logger.info(f"Volume {volume_id} is not gp2; no action taken.")
    
    except KeyError as e:
        logger.error(f"KeyError: {e}. Event data: {event}")
    except Exception as e:
        logger.error(f"An error occurred: {e}")
