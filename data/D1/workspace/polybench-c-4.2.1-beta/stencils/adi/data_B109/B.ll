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
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %14, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %14 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge5
  %indvars.iv = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next.1, %._crit_edge ]
  %3 = sub nuw nsw i64 %2, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = sub nuw nsw i64 %2, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %15, label %._crit_edge5

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
  store double 0x40AF420000000001, double* %10, align 8
  store double 0xC09F400000000001, double* %9, align 8
  store double 0xC09F400000000001, double* %11, align 8
  store double 0xC08F400000000001, double* %12, align 8
  store double 0x409F440000000001, double* %13, align 8
  store double 0xC08F400000000001, double* %14, align 8
  br label %.lr.ph19.preheader

.lr.ph19.preheader:                               ; preds = %._crit_edge34, %4
  %15 = phi [1000 x double]* [ %1, %4 ], [ %.pre45, %._crit_edge34 ]
  %16 = phi i32 [ 1, %4 ], [ %170, %._crit_edge34 ]
  %17 = phi [1000 x double]* [ %2, %4 ], [ %67, %._crit_edge34 ]
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %._crit_edge17..lr.ph19_crit_edge, %.lr.ph19.preheader
  %18 = phi [1000 x double]* [ %15, %.lr.ph19.preheader ], [ %.pre, %._crit_edge17..lr.ph19_crit_edge ]
  %indvars.iv15 = phi i64 [ 1, %.lr.ph19.preheader ], [ %30, %._crit_edge17..lr.ph19_crit_edge ]
  %19 = phi [1000 x double]* [ %17, %.lr.ph19.preheader ], [ %67, %._crit_edge17..lr.ph19_crit_edge ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 0, i64 %indvars.iv15
  store double 1.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv15, i64 0
  store double 0.000000e+00, double* %21, align 8
  %22 = load [1000 x double]*, [1000 x double]** %6, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 0, i64 %indvars.iv15
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = load [1000 x double]*, [1000 x double]** %8, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv15
  %28 = bitcast [1000 x double]* %27 to i64*
  store i64 %25, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv15, -1
  %30 = add nuw nsw i64 %indvars.iv15, 1
  %.pre39 = load double, double* %9, align 8
  %.pre40 = load double, double* %10, align 8
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %.lr.ph19
  %31 = phi double [ %.pre40, %.lr.ph19 ], [ %71, %._crit_edge68 ]
  %32 = phi double [ %.pre39, %.lr.ph19 ], [ %61, %._crit_edge68 ]
  %indvars.iv = phi i64 [ 1, %.lr.ph19 ], [ %indvars.iv.next, %._crit_edge68 ]
  %33 = phi [1000 x double]* [ %19, %.lr.ph19 ], [ %67, %._crit_edge68 ]
  %34 = load double, double* %11, align 8
  %35 = fsub double -0.000000e+00, %34
  %36 = add nsw i64 %indvars.iv, -1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %indvars.iv15, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fmul double %32, %38
  %40 = fadd double %39, %31
  %41 = fdiv double %35, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %indvars.iv15, i64 %indvars.iv
  store double %41, double* %42, align 8
  %43 = load double, double* %12, align 8
  %44 = load [1000 x double]*, [1000 x double]** %5, align 8
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv, i64 %29
  %46 = bitcast double* %45 to <2 x double>*
  %47 = fmul double %43, 2.000000e+00
  %48 = fadd double %47, 1.000000e+00
  %49 = load <2 x double>, <2 x double>* %46, align 8
  %50 = insertelement <2 x double> undef, double %43, i32 0
  %51 = insertelement <2 x double> %50, double %48, i32 1
  %52 = fmul <2 x double> %51, %49
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %54, %53
  %56 = load double, double* %14, align 8
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv, i64 %30
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %55, %59
  %61 = load double, double* %9, align 8
  %62 = load [1000 x double]*, [1000 x double]** %8, align 8
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv15, i64 %36
  %64 = load double, double* %63, align 8
  %65 = fmul double %61, %64
  %66 = fsub double %60, %65
  %67 = load [1000 x double]*, [1000 x double]** %7, align 8
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv15, i64 %36
  %69 = load double, double* %68, align 8
  %70 = fmul double %61, %69
  %71 = load double, double* %10, align 8
  %72 = fadd double %70, %71
  %73 = fdiv double %66, %72
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv15, i64 %indvars.iv
  store double %73, double* %74, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge, label %._crit_edge68

._crit_edge:                                      ; preds = %._crit_edge68
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv15
  store double 1.000000e+00, double* %75, align 8
  br label %76

; <label>:76:                                     ; preds = %._crit_edge42, %._crit_edge
  %indvars.iv13 = phi i64 [ 998, %._crit_edge ], [ %indvars.iv.next14.1, %._crit_edge42 ]
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv15, i64 %indvars.iv13
  %78 = load double, double* %77, align 8
  %79 = or i64 %indvars.iv13, 1
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %79, i64 %indvars.iv15
  %81 = load double, double* %80, align 8
  %82 = fmul double %78, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv15, i64 %indvars.iv13
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv13, i64 %indvars.iv15
  store double %85, double* %86, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, -1
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv15, i64 %indvars.iv.next14
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %85
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv15, i64 %indvars.iv.next14
  %91 = load double, double* %90, align 8
  %92 = fadd double %89, %91
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv.next14, i64 %indvars.iv15
  store double %92, double* %93, align 8
  %94 = icmp sgt i64 %indvars.iv.next14, 1
  br i1 %94, label %._crit_edge42, label %._crit_edge17

._crit_edge42:                                    ; preds = %76
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, -2
  br label %76

._crit_edge17:                                    ; preds = %76
  %exitcond17 = icmp eq i64 %30, 999
  br i1 %exitcond17, label %.lr.ph27.us.preheader, label %._crit_edge17..lr.ph19_crit_edge

._crit_edge17..lr.ph19_crit_edge:                 ; preds = %._crit_edge17
  %.pre = load [1000 x double]*, [1000 x double]** %6, align 8
  br label %.lr.ph19

.lr.ph27.us.preheader:                            ; preds = %._crit_edge17
  %.pre44 = load double, double* %13, align 8
  %.pre45 = load [1000 x double]*, [1000 x double]** %6, align 8
  %.pre46 = load double, double* %11, align 8
  %95 = fsub double -0.000000e+00, %56
  %96 = fmul double %61, 2.000000e+00
  %97 = fadd double %96, 1.000000e+00
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge31.us, %.lr.ph27.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph27.us.preheader ], [ %98, %._crit_edge31.us ]
  %indvars.iv23 = phi i64 [ 1, %.lr.ph27.us.preheader ], [ %107, %._crit_edge31.us ]
  %98 = add nuw nsw i64 %indvar, 1
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %67, i64 %98, i64 0
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %62, i64 %98, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %67, i64 %98, i64 999
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %62, i64 %98, i64 999
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv23, i64 0
  store double 1.000000e+00, double* %99, align 8
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv23, i64 0
  store double 0.000000e+00, double* %100, align 8
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv23
  %102 = bitcast [1000 x double]* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv23
  %105 = bitcast [1000 x double]* %104 to i64*
  store i64 %103, i64* %105, align 8
  %106 = add nsw i64 %indvars.iv23, -1
  %107 = add nuw nsw i64 %indvars.iv23, 1
  %bound0 = icmp ult double* %scevgep64, %scevgep62
  %bound1 = icmp ult double* %scevgep65, %scevgep58
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next19.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %108 = add nsw i64 %indvars.iv18.lver.orig, -1
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv23, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fmul double %43, %110
  %112 = fadd double %111, %.pre44
  %113 = fdiv double %95, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv23, i64 %indvars.iv18.lver.orig
  store double %113, double* %114, align 8
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre45, i64 %106, i64 %indvars.iv18.lver.orig
  %116 = load double, double* %115, align 8
  %117 = fmul double %61, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre45, i64 %indvars.iv23, i64 %indvars.iv18.lver.orig
  %119 = load double, double* %118, align 8
  %120 = fmul double %97, %119
  %121 = fsub double %120, %117
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre45, i64 %107, i64 %indvars.iv18.lver.orig
  %123 = load double, double* %122, align 8
  %124 = fmul double %.pre46, %123
  %125 = fsub double %121, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv23, i64 %108
  %127 = load double, double* %126, align 8
  %128 = fmul double %43, %127
  %129 = fsub double %125, %128
  %130 = fdiv double %129, %112
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv23, i64 %indvars.iv18.lver.orig
  store double %130, double* %131, align 8
  %indvars.iv.next19.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond20.lver.orig = icmp eq i64 %indvars.iv.next19.lver.orig, 999
  br i1 %exitcond20.lver.orig, label %.lr.ph30.us.preheader.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep64, align 8
  %load_initial66 = load double, double* %scevgep65, align 8
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71, %.ph
  %store_forwarded67 = phi double [ %load_initial66, %.ph ], [ %149, %._crit_edge71 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %134, %._crit_edge71 ]
  %indvars.iv18 = phi i64 [ 1, %.ph ], [ %indvars.iv.next19, %._crit_edge71 ]
  %132 = fmul double %43, %store_forwarded
  %133 = fadd double %132, %.pre44
  %134 = fdiv double %95, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv23, i64 %indvars.iv18
  store double %134, double* %135, align 8
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre45, i64 %106, i64 %indvars.iv18
  %137 = load double, double* %136, align 8
  %138 = fmul double %61, %137
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre45, i64 %indvars.iv23, i64 %indvars.iv18
  %140 = load double, double* %139, align 8
  %141 = fmul double %97, %140
  %142 = fsub double %141, %138
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre45, i64 %107, i64 %indvars.iv18
  %144 = load double, double* %143, align 8
  %145 = fmul double %.pre46, %144
  %146 = fsub double %142, %145
  %147 = fmul double %43, %store_forwarded67
  %148 = fsub double %146, %147
  %149 = fdiv double %148, %133
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv23, i64 %indvars.iv18
  store double %149, double* %150, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 999
  br i1 %exitcond20, label %.lr.ph30.us.preheader.loopexit72, label %._crit_edge71

.lr.ph30.us.preheader.loopexit:                   ; preds = %.ph.lver.orig
  br label %.lr.ph30.us.preheader

.lr.ph30.us.preheader.loopexit72:                 ; preds = %._crit_edge71
  br label %.lr.ph30.us.preheader

.lr.ph30.us.preheader:                            ; preds = %.lr.ph30.us.preheader.loopexit72, %.lr.ph30.us.preheader.loopexit
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv23, i64 999
  store double 1.000000e+00, double* %151, align 8
  br label %.lr.ph30.us

.lr.ph30.us:                                      ; preds = %.lr.ph30.us..lr.ph30.us_crit_edge, %.lr.ph30.us.preheader
  %indvars.iv21 = phi i64 [ 998, %.lr.ph30.us.preheader ], [ %indvars.iv.next22.1, %.lr.ph30.us..lr.ph30.us_crit_edge ]
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv23, i64 %indvars.iv21
  %153 = load double, double* %152, align 8
  %154 = or i64 %indvars.iv21, 1
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv23, i64 %154
  %156 = load double, double* %155, align 8
  %157 = fmul double %153, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv23, i64 %indvars.iv21
  %159 = load double, double* %158, align 8
  %160 = fadd double %157, %159
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv23, i64 %indvars.iv21
  store double %160, double* %161, align 8
  %indvars.iv.next22 = add nsw i64 %indvars.iv21, -1
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %67, i64 %indvars.iv23, i64 %indvars.iv.next22
  %163 = load double, double* %162, align 8
  %164 = fmul double %163, %160
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %indvars.iv23, i64 %indvars.iv.next22
  %166 = load double, double* %165, align 8
  %167 = fadd double %164, %166
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %indvars.iv23, i64 %indvars.iv.next22
  store double %167, double* %168, align 8
  %169 = icmp sgt i64 %indvars.iv.next22, 1
  br i1 %169, label %.lr.ph30.us..lr.ph30.us_crit_edge, label %._crit_edge31.us

.lr.ph30.us..lr.ph30.us_crit_edge:                ; preds = %.lr.ph30.us
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, -2
  br label %.lr.ph30.us

._crit_edge31.us:                                 ; preds = %.lr.ph30.us
  %exitcond25 = icmp eq i64 %107, 999
  br i1 %exitcond25, label %._crit_edge34, label %.lver.check

._crit_edge34:                                    ; preds = %._crit_edge31.us
  %170 = add nuw nsw i32 %16, 1
  %exitcond26 = icmp eq i32 %170, 501
  br i1 %exitcond26, label %171, label %.lr.ph19.preheader

; <label>:171:                                    ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %._crit_edge5
  %indvars.iv = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %._crit_edge5

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
