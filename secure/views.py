from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.response import Response
import subprocess
import os



import json


class SafetyCheckView(APIView):
    def post(self, request):
        requirements_content = request.data.get('requirements')
        if requirements_content:
            # Create a temporary requirements.txt file
            requirements_file_path = './requirements.txt'
            with open(requirements_file_path, 'w') as file:
                file.write(requirements_content)

            # Run safety check on the requirements.txt file
            cmd = ['safety', 'check', '-r', requirements_file_path]
            process = subprocess.Popen(
                cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            stdout, stderr = process.communicate()

            # Delete the temporary file
            os.remove(requirements_file_path)

            # Return the vulnerabilities as the API response
            vulnerabilities = stdout.decode('utf-8')
            return Response(vulnerabilities)
        else:
            return Response({'error': 'No requirements provided'}, status=400)


class CheckovCheckView(APIView):
    def post(self, request):
        requirements_content = request.data.get('commands')
        
        if requirements_content:
                    # Create a temporary Dockerfile
            requirements_file_path = './Dockerfile'
            with open(requirements_file_path, 'w') as file:
                file.write(requirements_content)
        

            # Run safety check on the requirements.txt file
            # cmd = ['checkov', '-d', '--framework', requirements_file_path]
            # cmd = ['checkov', '-d', '.', '--framework', 'dockerfile']
            # cmd = ['pwd']
            # cmd = ['ls ']
            # cmd = ['safety']
            # cmd = ['ipconfig']
            # cmd = ['ipconfig','--help']
            cmd = ['checkov','--help']
            

            #cmd = ['checkov -d . --framework', requirements_file_path]
            
            process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            
        
            stdout, stderr = process.communicate()

            # Delete the temporary file
            os.remove(requirements_file_path)

            # Return the vulnerabilities as the API response
            vulnerabilities = stdout.decode('utf-8')
            return Response(vulnerabilities)
        else:
            return Response({'error': 'No requirements provided'}, status=400)






# class CheckovCheckView(APIView):
#     def post(self, request):
#         data = json.loads(request.body)
#         dockerfile_contents = data.get('commands', '')

#         # Save the Dockerfile contents to a file
#         with open('dockerfile.json', 'w') as file:
#             file.write(json.dumps(dockerfile_contents))

#         try:
#             # Run Checkov and capture the output
#             checkov_output = subprocess.check_output(['checkov', '-f', 'dockerfile.json'], stderr=subprocess.STDOUT, text=True)
#             return Response({'result': checkov_output}, status=200)
#         except subprocess.CalledProcessError as e:
#             return Response({'error': e.output}, status=500)