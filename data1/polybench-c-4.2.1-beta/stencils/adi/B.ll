; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @init_array([1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  call fastcc void @print_array([1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %14 ]
  %2 = add nuw nsw i64 %indvars.iv13, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv2
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  store double %7, double* %8, align 8
  %indvars.iv.next = or i64 %indvars.iv2, 1
  %9 = sub nuw nsw i64 %2, %indvars.iv.next
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %12, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond3.1, label %14, label %3

; <label>:14:                                     ; preds = %3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %5 = alloca [1000 x double]*, align 8
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca [1000 x double]*, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  store [1000 x double]* %0, [1000 x double]** %5, align 8
  store [1000 x double]* %1, [1000 x double]** %6, align 8
  store [1000 x double]* %2, [1000 x double]** %7, align 8
  store [1000 x double]* %3, [1000 x double]** %8, align 8
  store double 0xC09F400000000001, double* %9, align 8
  store double 0x40AF420000000001, double* %10, align 8
  store double 0xC09F400000000001, double* %11, align 8
  store double 0xC08F400000000001, double* %12, align 8
  store double 0x409F440000000001, double* %13, align 8
  store double 0xC08F400000000001, double* %14, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %180, %4
  %15 = phi i32 [ 1, %4 ], [ %181, %180 ]
  %16 = phi [1000 x double]* [ %2, %4 ], [ %97, %180 ]
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %18 = phi [1000 x double]* [ %16, %.._crit_edge_crit_edge ], [ %66, %._crit_edge ]
  %indvars.iv1316 = phi i64 [ 1, %.._crit_edge_crit_edge ], [ %30, %._crit_edge ]
  %19 = load [1000 x double]*, [1000 x double]** %6, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv1316
  store double 1.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv1316, i64 0
  store double 0.000000e+00, double* %21, align 8
  %22 = load [1000 x double]*, [1000 x double]** %6, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 0, i64 %indvars.iv1316
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = load [1000 x double]*, [1000 x double]** %8, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv1316
  %28 = bitcast [1000 x double]* %27 to i64*
  store i64 %25, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv1316, -1
  %30 = add nuw nsw i64 %indvars.iv1316, 1
  br label %31

; <label>:31:                                     ; preds = %31, %17
  %32 = phi [1000 x double]* [ %18, %17 ], [ %66, %31 ]
  %indvars.iv14 = phi i64 [ 1, %17 ], [ %indvars.iv.next, %31 ]
  %33 = load double, double* %11, align 8
  %34 = fsub double -0.000000e+00, %33
  %35 = load double, double* %9, align 8
  %36 = add nsw i64 %indvars.iv14, -1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv1316, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fmul double %35, %38
  %40 = load double, double* %10, align 8
  %41 = fadd double %39, %40
  %42 = fdiv double %34, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv1316, i64 %indvars.iv14
  store double %42, double* %43, align 8
  %44 = load double, double* %12, align 8
  %45 = load [1000 x double]*, [1000 x double]** %5, align 8
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv14, i64 %29
  %47 = load double, double* %46, align 8
  %48 = fmul double %44, %47
  %49 = fmul double %44, 2.000000e+00
  %50 = fadd double %49, 1.000000e+00
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv14, i64 %indvars.iv1316
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %53, %48
  %55 = load double, double* %14, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv14, i64 %30
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fsub double %54, %58
  %60 = load double, double* %9, align 8
  %61 = load [1000 x double]*, [1000 x double]** %8, align 8
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv1316, i64 %36
  %63 = load double, double* %62, align 8
  %64 = fmul double %60, %63
  %65 = fsub double %59, %64
  %66 = load [1000 x double]*, [1000 x double]** %7, align 8
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv1316, i64 %36
  %68 = load double, double* %67, align 8
  %69 = fmul double %60, %68
  %70 = load double, double* %10, align 8
  %71 = fadd double %69, %70
  %72 = fdiv double %65, %71
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv1316, i64 %indvars.iv14
  store double %72, double* %73, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond23, label %74, label %31

; <label>:74:                                     ; preds = %31
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv1316
  store double 1.000000e+00, double* %75, align 8
  br label %76

; <label>:76:                                     ; preds = %76, %74
  %indvars.iv1115 = phi i64 [ 998, %74 ], [ %indvars.iv.next12.1, %76 ]
  %77 = phi double [ 1.000000e+00, %74 ], [ %90, %76 ]
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv1316, i64 %indvars.iv1115
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %77
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv1316, i64 %indvars.iv1115
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv1115, i64 %indvars.iv1316
  store double %83, double* %84, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv1115, -1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv1316, i64 %indvars.iv.next12
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %83
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv1316, i64 %indvars.iv.next12
  %89 = load double, double* %88, align 8
  %90 = fadd double %87, %89
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv.next12, i64 %indvars.iv1316
  store double %90, double* %91, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1115, -2
  %92 = icmp sgt i64 %indvars.iv.next12, 1
  br i1 %92, label %76, label %._crit_edge

._crit_edge:                                      ; preds = %76
  %exitcond10 = icmp eq i64 %30, 999
  br i1 %exitcond10, label %._crit_edge..lver.check_crit_edge, label %17

._crit_edge..lver.check_crit_edge:                ; preds = %._crit_edge
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge24, %._crit_edge..lver.check_crit_edge
  %indvar = phi i64 [ 0, %._crit_edge..lver.check_crit_edge ], [ %indvar.next, %._crit_edge24 ]
  %93 = phi [1000 x double]* [ %45, %._crit_edge..lver.check_crit_edge ], [ %99, %._crit_edge24 ]
  %indvars.iv2119 = phi i64 [ 1, %._crit_edge..lver.check_crit_edge ], [ %116, %._crit_edge24 ]
  %94 = add nuw nsw i64 %indvar, 1
  %95 = add nuw nsw i64 %indvar, 1
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %93, i64 %indvars.iv2119, i64 0
  store double 1.000000e+00, double* %96, align 8
  %97 = load [1000 x double]*, [1000 x double]** %7, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv2119, i64 0
  store double 0.000000e+00, double* %98, align 8
  %99 = load [1000 x double]*, [1000 x double]** %5, align 8
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv2119
  %101 = bitcast [1000 x double]* %100 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = load [1000 x double]*, [1000 x double]** %8, align 8
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %indvars.iv2119
  %105 = bitcast [1000 x double]* %104 to i64*
  store i64 %102, i64* %105, align 8
  %106 = load double, double* %14, align 8
  %107 = fsub double -0.000000e+00, %106
  %108 = load double, double* %12, align 8
  %109 = load double, double* %13, align 8
  %110 = load double, double* %9, align 8
  %111 = load [1000 x double]*, [1000 x double]** %6, align 8
  %112 = add nsw i64 %indvars.iv2119, -1
  %113 = fmul double %110, 2.000000e+00
  %114 = fadd double %113, 1.000000e+00
  %115 = load double, double* %11, align 8
  %116 = add nuw nsw i64 %indvars.iv2119, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %97, i64 %95, i64 0
  %scevgep21 = getelementptr [1000 x double], [1000 x double]* %97, i64 %95, i64 999
  %scevgep23 = getelementptr [1000 x double], [1000 x double]* %103, i64 %95, i64 0
  %scevgep25 = getelementptr [1000 x double], [1000 x double]* %103, i64 %95, i64 999
  %bound0 = icmp ult double* %scevgep, %scevgep25
  %bound1 = icmp ult double* %scevgep23, %scevgep21
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lver.check..ph.lver.orig_crit_edge, label %.ph

.lver.check..ph.lver.orig_crit_edge:              ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig, %.lver.check..ph.lver.orig_crit_edge
  %indvars.iv1517.lver.orig = phi i64 [ 1, %.lver.check..ph.lver.orig_crit_edge ], [ %indvars.iv.next16.lver.orig, %.ph.lver.orig ]
  %117 = add nsw i64 %indvars.iv1517.lver.orig, -1
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv2119, i64 %117
  %119 = load double, double* %118, align 8
  %120 = fmul double %108, %119
  %121 = fadd double %120, %109
  %122 = fdiv double %107, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv2119, i64 %indvars.iv1517.lver.orig
  store double %122, double* %123, align 8
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 %112, i64 %indvars.iv1517.lver.orig
  %125 = load double, double* %124, align 8
  %126 = fmul double %110, %125
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 %indvars.iv2119, i64 %indvars.iv1517.lver.orig
  %128 = load double, double* %127, align 8
  %129 = fmul double %114, %128
  %130 = fsub double %129, %126
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 %116, i64 %indvars.iv1517.lver.orig
  %132 = load double, double* %131, align 8
  %133 = fmul double %115, %132
  %134 = fsub double %130, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %indvars.iv2119, i64 %117
  %136 = load double, double* %135, align 8
  %137 = fmul double %108, %136
  %138 = fsub double %134, %137
  %139 = fdiv double %138, %121
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %indvars.iv2119, i64 %indvars.iv1517.lver.orig
  store double %139, double* %140, align 8
  %indvars.iv.next16.lver.orig = add nuw nsw i64 %indvars.iv1517.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next16.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %97, i64 %94, i64 0
  %load_initial = load double, double* %scevgep27, align 8
  %scevgep28 = getelementptr [1000 x double], [1000 x double]* %103, i64 %94, i64 0
  %load_initial29 = load double, double* %scevgep28, align 8
  br label %141

; <label>:141:                                    ; preds = %141, %.ph
  %store_forwarded30 = phi double [ %load_initial29, %.ph ], [ %159, %141 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %144, %141 ]
  %indvars.iv1517 = phi i64 [ 1, %.ph ], [ %indvars.iv.next16, %141 ]
  %142 = fmul double %108, %store_forwarded
  %143 = fadd double %142, %109
  %144 = fdiv double %107, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv2119, i64 %indvars.iv1517
  store double %144, double* %145, align 8
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 %112, i64 %indvars.iv1517
  %147 = load double, double* %146, align 8
  %148 = fmul double %110, %147
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 %indvars.iv2119, i64 %indvars.iv1517
  %150 = load double, double* %149, align 8
  %151 = fmul double %114, %150
  %152 = fsub double %151, %148
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 %116, i64 %indvars.iv1517
  %154 = load double, double* %153, align 8
  %155 = fmul double %115, %154
  %156 = fsub double %152, %155
  %157 = fmul double %108, %store_forwarded30
  %158 = fsub double %156, %157
  %159 = fdiv double %158, %143
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %indvars.iv2119, i64 %indvars.iv1517
  store double %159, double* %160, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1517, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 999
  br i1 %exitcond, label %.loopexit39, label %141

.loopexit:                                        ; preds = %.ph.lver.orig
  br label %161

.loopexit39:                                      ; preds = %141
  br label %161

; <label>:161:                                    ; preds = %.loopexit39, %.loopexit
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv2119, i64 999
  store double 1.000000e+00, double* %162, align 8
  br label %163

; <label>:163:                                    ; preds = %163, %161
  %indvars.iv1918 = phi i64 [ 998, %161 ], [ %indvars.iv.next20.1, %163 ]
  %164 = phi double [ 1.000000e+00, %161 ], [ %177, %163 ]
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv2119, i64 %indvars.iv1918
  %166 = load double, double* %165, align 8
  %167 = fmul double %166, %164
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %indvars.iv2119, i64 %indvars.iv1918
  %169 = load double, double* %168, align 8
  %170 = fadd double %167, %169
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv2119, i64 %indvars.iv1918
  store double %170, double* %171, align 8
  %indvars.iv.next20 = add nsw i64 %indvars.iv1918, -1
  %172 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv2119, i64 %indvars.iv.next20
  %173 = load double, double* %172, align 8
  %174 = fmul double %173, %170
  %175 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %indvars.iv2119, i64 %indvars.iv.next20
  %176 = load double, double* %175, align 8
  %177 = fadd double %174, %176
  %178 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv2119, i64 %indvars.iv.next20
  store double %177, double* %178, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv1918, -2
  %179 = icmp sgt i64 %indvars.iv.next20, 1
  br i1 %179, label %163, label %._crit_edge24

._crit_edge24:                                    ; preds = %163
  %exitcond11 = icmp eq i64 %116, 999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond11, label %180, label %.lver.check

; <label>:180:                                    ; preds = %._crit_edge24
  %181 = add nuw nsw i32 %15, 1
  %exitcond12 = icmp eq i32 %181, 501
  br i1 %exitcond12, label %182, label %.._crit_edge_crit_edge

; <label>:182:                                    ; preds = %180
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge5, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge5 ]
  %8 = add nuw nsw i64 %6, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge5

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond3, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
