#!/bin/sh
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

# tools/convert2md.sh ${1} ${2}
# ${1} Template type 'brand','navigator','page'
# ${2} Path of mdtext file to convert to md file

if test "$#" != 2; then
  echo "USAGE: $0 Type Path"
  exit 1
fi

MDPATH=${2:0:${#2}-4}
echo "Convert "${2}" to "${MDPATH}
echo "type="${1} > ${GITPATH}/part2/content/${MDPATH}
awk -f ${GITPATH}/tools/convert2md.awk ${2} >> ${GITPATH}/part2/content/${MDPATH}

