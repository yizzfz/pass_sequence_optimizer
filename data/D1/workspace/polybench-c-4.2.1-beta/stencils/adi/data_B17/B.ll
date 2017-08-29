; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  call void @init_array([1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  call void @print_array([1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture) #2 {
.lr.ph2.preheader:
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv4 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next5, %._crit_edge ]
  %1 = add nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = sub nuw nsw i64 %1, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 1.000000e+03, double 1.000000e+03>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge, label %._crit_edge1

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #2 {
.lr.ph39.preheader:
  %4 = alloca [1000 x double]*, align 8
  %5 = alloca [1000 x double]*, align 8
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store [1000 x double]* %0, [1000 x double]** %4, align 8
  store [1000 x double]* %1, [1000 x double]** %5, align 8
  store [1000 x double]* %2, [1000 x double]** %6, align 8
  store [1000 x double]* %3, [1000 x double]** %7, align 8
  store double 0xC09F400000000001, double* %8, align 8
  store double 0xC09F400000000001, double* %10, align 8
  store double 0xC08F400000000001, double* %11, align 8
  store double 0x40AF420000000001, double* %9, align 8
  store double 0x409F440000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  br label %.lr.ph39

.lr.ph39:                                         ; preds = %._crit_edge34, %.lr.ph39.preheader
  %14 = phi i32 [ 1, %.lr.ph39.preheader ], [ %157, %._crit_edge34 ]
  %15 = phi [1000 x double]* [ %2, %.lr.ph39.preheader ], [ %94, %._crit_edge34 ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge18, %.lr.ph39
  %indvars.iv46 = phi i64 [ 1, %.lr.ph39 ], [ %indvars.iv.next47, %._crit_edge18 ]
  %16 = phi [1000 x double]* [ %15, %.lr.ph39 ], [ %64, %._crit_edge18 ]
  %17 = load [1000 x double]*, [1000 x double]** %5, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 0, i64 %indvars.iv46
  store double 1.000000e+00, double* %18, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %16, i64 %indvars.iv46, i64 0
  store double 0.000000e+00, double* %19, align 8
  %20 = load [1000 x double]*, [1000 x double]** %5, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 0, i64 %indvars.iv46
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = load [1000 x double]*, [1000 x double]** %7, align 8
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv46
  %26 = bitcast [1000 x double]* %25 to i64*
  store i64 %23, i64* %26, align 8
  %27 = add nsw i64 %indvars.iv46, -1
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %._crit_edge1 ]
  %28 = phi [1000 x double]* [ %16, %.lr.ph ], [ %64, %._crit_edge1 ]
  %29 = load double, double* %10, align 8
  %30 = fsub double -0.000000e+00, %29
  %31 = load double, double* %8, align 8
  %32 = add nsw i64 %indvars.iv, -1
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %28, i64 %indvars.iv46, i64 %32
  %34 = load double, double* %33, align 8
  %35 = fmul double %31, %34
  %36 = load double, double* %9, align 8
  %37 = fadd double %35, %36
  %38 = fdiv double %30, %37
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %28, i64 %indvars.iv46, i64 %indvars.iv
  store double %38, double* %39, align 8
  %40 = load double, double* %11, align 8
  %41 = load [1000 x double]*, [1000 x double]** %4, align 8
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %41, i64 %indvars.iv, i64 %27
  %43 = bitcast double* %42 to <2 x double>*
  %44 = fmul double %40, 2.000000e+00
  %45 = fadd double %44, 1.000000e+00
  %46 = load <2 x double>, <2 x double>* %43, align 8
  %47 = insertelement <2 x double> undef, double %40, i32 0
  %48 = insertelement <2 x double> %47, double %45, i32 1
  %49 = fmul <2 x double> %48, %46
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %52 = fsub double %51, %50
  %53 = load double, double* %13, align 8
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %41, i64 %indvars.iv, i64 %indvars.iv.next47
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fsub double %52, %56
  %58 = load double, double* %8, align 8
  %59 = load [1000 x double]*, [1000 x double]** %7, align 8
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv46, i64 %32
  %61 = load double, double* %60, align 8
  %62 = fmul double %58, %61
  %63 = fsub double %57, %62
  %64 = load [1000 x double]*, [1000 x double]** %6, align 8
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %64, i64 %indvars.iv46, i64 %32
  %66 = load double, double* %65, align 8
  %67 = fmul double %58, %66
  %68 = load double, double* %9, align 8
  %69 = fadd double %67, %68
  %70 = fdiv double %63, %69
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv46, i64 %indvars.iv
  store double %70, double* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge, label %._crit_edge1

._crit_edge:                                      ; preds = %._crit_edge1
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 999, i64 %indvars.iv46
  store double 1.000000e+00, double* %72, align 8
  br label %73

; <label>:73:                                     ; preds = %._crit_edge2, %._crit_edge
  %indvars.iv44 = phi i64 [ 998, %._crit_edge ], [ %indvars.iv.next45.1, %._crit_edge2 ]
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %64, i64 %indvars.iv46, i64 %indvars.iv44
  %75 = load double, double* %74, align 8
  %76 = or i64 %indvars.iv44, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %76, i64 %indvars.iv46
  %78 = load double, double* %77, align 8
  %79 = fmul double %75, %78
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv46, i64 %indvars.iv44
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv44, i64 %indvars.iv46
  store double %82, double* %83, align 8
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %64, i64 %indvars.iv46, i64 %indvars.iv.next45
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %82
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv46, i64 %indvars.iv.next45
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv.next45, i64 %indvars.iv46
  store double %89, double* %90, align 8
  %91 = icmp sgt i64 %indvars.iv.next45, 1
  br i1 %91, label %._crit_edge2, label %._crit_edge18

._crit_edge2:                                     ; preds = %73
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, -2
  br label %73

._crit_edge18:                                    ; preds = %73
  %exitcond48 = icmp eq i64 %indvars.iv.next47, 999
  br i1 %exitcond48, label %.lr.ph33.preheader, label %.lr.ph

.lr.ph33.preheader:                               ; preds = %._crit_edge18
  br label %.lr.ph33

.lr.ph33:                                         ; preds = %.lr.ph33.preheader, %._crit_edge31
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge31 ], [ 1, %.lr.ph33.preheader ]
  %92 = phi [1000 x double]* [ %96, %._crit_edge31 ], [ %41, %.lr.ph33.preheader ]
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %92, i64 %indvars.iv54, i64 0
  store double 1.000000e+00, double* %93, align 8
  %94 = load [1000 x double]*, [1000 x double]** %6, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %94, i64 %indvars.iv54, i64 0
  store double 0.000000e+00, double* %95, align 8
  %96 = load [1000 x double]*, [1000 x double]** %4, align 8
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %96, i64 %indvars.iv54
  %98 = bitcast [1000 x double]* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = load [1000 x double]*, [1000 x double]** %7, align 8
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %100, i64 %indvars.iv54
  %102 = bitcast [1000 x double]* %101 to i64*
  store i64 %99, i64* %102, align 8
  %103 = load double, double* %13, align 8
  %104 = fsub double -0.000000e+00, %103
  %105 = load double, double* %11, align 8
  %106 = load double, double* %12, align 8
  %107 = load double, double* %8, align 8
  %108 = load [1000 x double]*, [1000 x double]** %5, align 8
  %109 = add nsw i64 %indvars.iv54, -1
  %110 = fmul double %107, 2.000000e+00
  %111 = fadd double %110, 1.000000e+00
  %112 = load double, double* %10, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %.lr.ph33
  %indvars.iv49 = phi i64 [ 1, %.lr.ph33 ], [ %indvars.iv.next50, %._crit_edge3 ]
  %113 = add nsw i64 %indvars.iv49, -1
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %94, i64 %indvars.iv54, i64 %113
  %115 = load double, double* %114, align 8
  %116 = fmul double %105, %115
  %117 = fadd double %116, %106
  %118 = fdiv double %104, %117
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %94, i64 %indvars.iv54, i64 %indvars.iv49
  store double %118, double* %119, align 8
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %109, i64 %indvars.iv49
  %121 = load double, double* %120, align 8
  %122 = fmul double %107, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv54, i64 %indvars.iv49
  %124 = load double, double* %123, align 8
  %125 = fmul double %111, %124
  %126 = fsub double %125, %122
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv.next55, i64 %indvars.iv49
  %128 = load double, double* %127, align 8
  %129 = fmul double %112, %128
  %130 = fsub double %126, %129
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %100, i64 %indvars.iv54, i64 %113
  %132 = load double, double* %131, align 8
  %133 = fmul double %105, %132
  %134 = fsub double %130, %133
  %135 = fdiv double %134, %117
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %100, i64 %indvars.iv54, i64 %indvars.iv49
  store double %135, double* %136, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 999
  br i1 %exitcond51, label %._crit_edge28, label %._crit_edge3

._crit_edge28:                                    ; preds = %._crit_edge3
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %96, i64 %indvars.iv54, i64 999
  store double 1.000000e+00, double* %137, align 8
  br label %138

; <label>:138:                                    ; preds = %._crit_edge4, %._crit_edge28
  %indvars.iv52 = phi i64 [ 998, %._crit_edge28 ], [ %indvars.iv.next53.1, %._crit_edge4 ]
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %94, i64 %indvars.iv54, i64 %indvars.iv52
  %140 = load double, double* %139, align 8
  %141 = or i64 %indvars.iv52, 1
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %96, i64 %indvars.iv54, i64 %141
  %143 = load double, double* %142, align 8
  %144 = fmul double %140, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %100, i64 %indvars.iv54, i64 %indvars.iv52
  %146 = load double, double* %145, align 8
  %147 = fadd double %144, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %96, i64 %indvars.iv54, i64 %indvars.iv52
  store double %147, double* %148, align 8
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %94, i64 %indvars.iv54, i64 %indvars.iv.next53
  %150 = load double, double* %149, align 8
  %151 = fmul double %150, %147
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %100, i64 %indvars.iv54, i64 %indvars.iv.next53
  %153 = load double, double* %152, align 8
  %154 = fadd double %151, %153
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %96, i64 %indvars.iv54, i64 %indvars.iv.next53
  store double %154, double* %155, align 8
  %156 = icmp sgt i64 %indvars.iv.next53, 1
  br i1 %156, label %._crit_edge4, label %._crit_edge31

._crit_edge4:                                     ; preds = %138
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, -2
  br label %138

._crit_edge31:                                    ; preds = %138
  %exitcond56 = icmp eq i64 %indvars.iv.next55, 999
  br i1 %exitcond56, label %._crit_edge34, label %.lr.ph33

._crit_edge34:                                    ; preds = %._crit_edge31
  %157 = add nuw nsw i32 %14, 1
  %exitcond57 = icmp eq i32 %157, 501
  br i1 %exitcond57, label %._crit_edge40, label %.lr.ph39

._crit_edge40:                                    ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1000 x double]* nocapture readonly) #0 {
.lr.ph2.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv4 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next5, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge1 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge1

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
