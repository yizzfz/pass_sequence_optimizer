; ModuleID = 'patricia_test.ll'
source_filename = "patricia_test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ptree = type { i64, %struct.ptree_mask*, i8, i8, %struct.ptree*, %struct.ptree* }
%struct.ptree_mask = type { i64, i8* }
%struct.in_addr = type { i32 }
%struct.MyNode = type { i32, double }

@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Found.\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.ptree*, align 8
  %8 = alloca %struct.ptree*, align 8
  %9 = alloca %struct.ptree*, align 8
  %10 = alloca %struct.ptree_mask*, align 8
  %11 = alloca %struct._IO_FILE*, align 8
  %12 = alloca [128 x i8], align 16
  %13 = alloca [16 x i8], align 16
  %14 = alloca %struct.in_addr, align 4
  %15 = alloca i64, align 8
  %16 = alloca float, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  store i64 4294967295, i64* %15, align 8
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %17, 2
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %3
  %20 = load i8**, i8*** %5, align 8
  %21 = getelementptr inbounds i8*, i8** %20, i64 0
  %22 = load i8*, i8** %21, align 8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i8* %22)
  call void @exit(i32 1) #5
  unreachable

; <label>:24:                                     ; preds = %3
  %25 = load i8**, i8*** %5, align 8
  %26 = getelementptr inbounds i8*, i8** %25, i64 1
  %27 = load i8*, i8** %26, align 8
  %28 = call %struct._IO_FILE* @fopen(i8* %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %28, %struct._IO_FILE** %11, align 8
  %29 = icmp eq %struct._IO_FILE* %28, null
  br i1 %29, label %30, label %35

; <label>:30:                                     ; preds = %24
  %31 = load i8**, i8*** %5, align 8
  %32 = getelementptr inbounds i8*, i8** %31, i64 1
  %33 = load i8*, i8** %32, align 8
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i32 0, i32 0), i8* %33)
  call void @exit(i32 1) #5
  unreachable

; <label>:35:                                     ; preds = %24
  %36 = call noalias i8* @malloc(i64 40) #6
  %37 = bitcast i8* %36 to %struct.ptree*
  store %struct.ptree* %37, %struct.ptree** %7, align 8
  %38 = load %struct.ptree*, %struct.ptree** %7, align 8
  %39 = icmp ne %struct.ptree* %38, null
  br i1 %39, label %41, label %40

; <label>:40:                                     ; preds = %35
  call void @perror(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:41:                                     ; preds = %35
  %42 = load %struct.ptree*, %struct.ptree** %7, align 8
  %43 = bitcast %struct.ptree* %42 to i8*
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 40, i32 8, i1 false)
  %44 = call noalias i8* @malloc(i64 16) #6
  %45 = bitcast i8* %44 to %struct.ptree_mask*
  %46 = load %struct.ptree*, %struct.ptree** %7, align 8
  %47 = getelementptr inbounds %struct.ptree, %struct.ptree* %46, i32 0, i32 1
  store %struct.ptree_mask* %45, %struct.ptree_mask** %47, align 8
  %48 = load %struct.ptree*, %struct.ptree** %7, align 8
  %49 = getelementptr inbounds %struct.ptree, %struct.ptree* %48, i32 0, i32 1
  %50 = load %struct.ptree_mask*, %struct.ptree_mask** %49, align 8
  %51 = icmp ne %struct.ptree_mask* %50, null
  br i1 %51, label %53, label %52

; <label>:52:                                     ; preds = %41
  call void @perror(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:53:                                     ; preds = %41
  %54 = load %struct.ptree*, %struct.ptree** %7, align 8
  %55 = getelementptr inbounds %struct.ptree, %struct.ptree* %54, i32 0, i32 1
  %56 = load %struct.ptree_mask*, %struct.ptree_mask** %55, align 8
  %57 = bitcast %struct.ptree_mask* %56 to i8*
  call void @llvm.memset.p0i8.i64(i8* %57, i8 0, i64 16, i32 8, i1 false)
  %58 = load %struct.ptree*, %struct.ptree** %7, align 8
  %59 = getelementptr inbounds %struct.ptree, %struct.ptree* %58, i32 0, i32 1
  %60 = load %struct.ptree_mask*, %struct.ptree_mask** %59, align 8
  store %struct.ptree_mask* %60, %struct.ptree_mask** %10, align 8
  %61 = call noalias i8* @malloc(i64 16) #6
  %62 = bitcast i8* %61 to %struct.MyNode*
  %63 = bitcast %struct.MyNode* %62 to i8*
  %64 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %65 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %64, i32 0, i32 1
  store i8* %63, i8** %65, align 8
  %66 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %67 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %66, i32 0, i32 1
  %68 = load i8*, i8** %67, align 8
  %69 = icmp ne i8* %68, null
  br i1 %69, label %71, label %70

; <label>:70:                                     ; preds = %53
  call void @perror(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:71:                                     ; preds = %53
  %72 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %73 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %72, i32 0, i32 1
  %74 = load i8*, i8** %73, align 8
  call void @llvm.memset.p0i8.i64(i8* %74, i8 0, i64 1, i32 1, i1 false)
  %75 = load %struct.ptree*, %struct.ptree** %7, align 8
  %76 = getelementptr inbounds %struct.ptree, %struct.ptree* %75, i32 0, i32 2
  store i8 1, i8* %76, align 8
  %77 = load %struct.ptree*, %struct.ptree** %7, align 8
  %78 = load %struct.ptree*, %struct.ptree** %7, align 8
  %79 = getelementptr inbounds %struct.ptree, %struct.ptree* %78, i32 0, i32 5
  store %struct.ptree* %77, %struct.ptree** %79, align 8
  %80 = load %struct.ptree*, %struct.ptree** %7, align 8
  %81 = getelementptr inbounds %struct.ptree, %struct.ptree* %80, i32 0, i32 4
  store %struct.ptree* %77, %struct.ptree** %81, align 8
  br label %82

; <label>:82:                                     ; preds = %186, %71
  %83 = getelementptr inbounds [128 x i8], [128 x i8]* %12, i32 0, i32 0
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %85 = call i8* @fgets(i8* %83, i32 128, %struct._IO_FILE* %84)
  %86 = icmp ne i8* %85, null
  br i1 %86, label %87, label %187

; <label>:87:                                     ; preds = %82
  %88 = getelementptr inbounds [128 x i8], [128 x i8]* %12, i32 0, i32 0
  %89 = bitcast %struct.in_addr* %14 to i32*
  %90 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %88, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), float* %16, i32* %89) #6
  %91 = call noalias i8* @malloc(i64 40) #6
  %92 = bitcast i8* %91 to %struct.ptree*
  store %struct.ptree* %92, %struct.ptree** %8, align 8
  %93 = load %struct.ptree*, %struct.ptree** %8, align 8
  %94 = icmp ne %struct.ptree* %93, null
  br i1 %94, label %96, label %95

; <label>:95:                                     ; preds = %87
  call void @perror(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:96:                                     ; preds = %87
  %97 = load %struct.ptree*, %struct.ptree** %8, align 8
  %98 = bitcast %struct.ptree* %97 to i8*
  call void @llvm.memset.p0i8.i64(i8* %98, i8 0, i64 40, i32 8, i1 false)
  %99 = call noalias i8* @malloc(i64 16) #6
  %100 = bitcast i8* %99 to %struct.ptree_mask*
  %101 = load %struct.ptree*, %struct.ptree** %8, align 8
  %102 = getelementptr inbounds %struct.ptree, %struct.ptree* %101, i32 0, i32 1
  store %struct.ptree_mask* %100, %struct.ptree_mask** %102, align 8
  %103 = load %struct.ptree*, %struct.ptree** %8, align 8
  %104 = getelementptr inbounds %struct.ptree, %struct.ptree* %103, i32 0, i32 1
  %105 = load %struct.ptree_mask*, %struct.ptree_mask** %104, align 8
  %106 = icmp ne %struct.ptree_mask* %105, null
  br i1 %106, label %108, label %107

; <label>:107:                                    ; preds = %96
  call void @perror(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:108:                                    ; preds = %96
  %109 = load %struct.ptree*, %struct.ptree** %8, align 8
  %110 = getelementptr inbounds %struct.ptree, %struct.ptree* %109, i32 0, i32 1
  %111 = load %struct.ptree_mask*, %struct.ptree_mask** %110, align 8
  %112 = bitcast %struct.ptree_mask* %111 to i8*
  call void @llvm.memset.p0i8.i64(i8* %112, i8 0, i64 16, i32 8, i1 false)
  %113 = load %struct.ptree*, %struct.ptree** %8, align 8
  %114 = getelementptr inbounds %struct.ptree, %struct.ptree* %113, i32 0, i32 1
  %115 = load %struct.ptree_mask*, %struct.ptree_mask** %114, align 8
  store %struct.ptree_mask* %115, %struct.ptree_mask** %10, align 8
  %116 = call noalias i8* @malloc(i64 16) #6
  %117 = bitcast i8* %116 to %struct.MyNode*
  %118 = bitcast %struct.MyNode* %117 to i8*
  %119 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %120 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %119, i32 0, i32 1
  store i8* %118, i8** %120, align 8
  %121 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %122 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %121, i32 0, i32 1
  %123 = load i8*, i8** %122, align 8
  %124 = icmp ne i8* %123, null
  br i1 %124, label %126, label %125

; <label>:125:                                    ; preds = %108
  call void @perror(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:126:                                    ; preds = %108
  %127 = load %struct.ptree_mask*, %struct.ptree_mask** %10, align 8
  %128 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %127, i32 0, i32 1
  %129 = load i8*, i8** %128, align 8
  call void @llvm.memset.p0i8.i64(i8* %129, i8 0, i64 1, i32 1, i1 false)
  %130 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %131 = load i32, i32* %130, align 4
  %132 = zext i32 %131 to i64
  %133 = load %struct.ptree*, %struct.ptree** %8, align 8
  %134 = getelementptr inbounds %struct.ptree, %struct.ptree* %133, i32 0, i32 0
  store i64 %132, i64* %134, align 8
  %135 = load i64, i64* %15, align 8
  %136 = and i64 %135, 4278190080
  %137 = lshr i64 %136, 24
  %138 = load i64, i64* %15, align 8
  %139 = and i64 %138, 16711680
  %140 = lshr i64 %139, 8
  %141 = or i64 %137, %140
  %142 = load i64, i64* %15, align 8
  %143 = and i64 %142, 65280
  %144 = shl i64 %143, 8
  %145 = or i64 %141, %144
  %146 = load i64, i64* %15, align 8
  %147 = and i64 %146, 255
  %148 = shl i64 %147, 24
  %149 = or i64 %145, %148
  %150 = load %struct.ptree*, %struct.ptree** %8, align 8
  %151 = getelementptr inbounds %struct.ptree, %struct.ptree* %150, i32 0, i32 1
  %152 = load %struct.ptree_mask*, %struct.ptree_mask** %151, align 8
  %153 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %152, i32 0, i32 0
  store i64 %149, i64* %153, align 8
  %154 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %155 = load i32, i32* %154, align 4
  %156 = zext i32 %155 to i64
  %157 = load %struct.ptree*, %struct.ptree** %7, align 8
  %158 = call %struct.ptree* @pat_search(i64 %156, %struct.ptree* %157)
  store %struct.ptree* %158, %struct.ptree** %9, align 8
  %159 = load %struct.ptree*, %struct.ptree** %9, align 8
  %160 = getelementptr inbounds %struct.ptree, %struct.ptree* %159, i32 0, i32 0
  %161 = load i64, i64* %160, align 8
  %162 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %163 = load i32, i32* %162, align 4
  %164 = zext i32 %163 to i64
  %165 = icmp eq i64 %161, %164
  br i1 %165, label %166, label %176

; <label>:166:                                    ; preds = %126
  %167 = load i32, i32* %6, align 4
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %169, label %176

; <label>:169:                                    ; preds = %166
  %170 = load float, float* %16, align 4
  %171 = fpext float %170 to double
  %172 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %14, i32 0, i32 0
  %173 = load i32, i32* %172, align 4
  %174 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), double %171, i32 %173)
  %175 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0))
  br label %180

; <label>:176:                                    ; preds = %166, %126
  %177 = load %struct.ptree*, %struct.ptree** %8, align 8
  %178 = load %struct.ptree*, %struct.ptree** %7, align 8
  %179 = call %struct.ptree* @pat_insert(%struct.ptree* %177, %struct.ptree* %178)
  store %struct.ptree* %179, %struct.ptree** %8, align 8
  br label %180

; <label>:180:                                    ; preds = %176, %169
  %181 = load %struct.ptree*, %struct.ptree** %8, align 8
  %182 = icmp ne %struct.ptree* %181, null
  br i1 %182, label %186, label %183

; <label>:183:                                    ; preds = %180
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %185 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %184, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:186:                                    ; preds = %180
  br label %82

; <label>:187:                                    ; preds = %82
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %189 = call i32 @fclose(%struct._IO_FILE* %188)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @perror(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

declare %struct.ptree* @pat_search(i64, %struct.ptree*) #1

declare %struct.ptree* @pat_insert(%struct.ptree*, %struct.ptree*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
