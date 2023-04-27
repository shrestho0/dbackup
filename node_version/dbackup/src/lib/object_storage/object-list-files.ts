import { PUBLIC_LINODE_OBJECT_BUCKET as LINODE_OBJECT_BUCKET } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_ENDPOINT as LINODE_OBJECT_STORAGE_ENDPOINT } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_REGION as LINODE_OBJECT_STORAGE_REGION } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_ACCESS_KEY_ID as LINODE_OBJECT_STORAGE_ACCESS_KEY_ID } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_SECRET_ACCESS_KEY as LINODE_OBJECT_STORAGE_SECRET_ACCESS_KEY } from '$env/static/public';
import { Credentials, S3 } from 'aws-sdk';

import { ListObjectsV2Command } from "@aws-sdk/client-s3";


export const list_all_files = async () => {
    return LINODE_OBJECT_BUCKET
}


const s3Client = new S3({
    region: LINODE_OBJECT_STORAGE_REGION,
    endpoint: LINODE_OBJECT_STORAGE_ENDPOINT,
    sslEnabled: true,
    s3ForcePathStyle: false,
    credentials: new Credentials({
        accessKeyId: LINODE_OBJECT_STORAGE_ACCESS_KEY_ID,
        secretAccessKey: LINODE_OBJECT_STORAGE_SECRET_ACCESS_KEY,
    }),
});
