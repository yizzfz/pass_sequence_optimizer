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
  br label %.preheader

.preheader:                                       ; preds = %15, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %15 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %15, label %3

; <label>:15:                                     ; preds = %3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
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
  store double 0xC09F400000000001, double* %11, align 8
  store double 0xC08F400000000001, double* %12, align 8
  store double 0x40AF420000000001, double* %10, align 8
  store double 0x409F440000000001, double* %13, align 8
  store double 0xC08F400000000001, double* %14, align 8
  br label %.preheader1

.preheader1:                                      ; preds = %._crit_edge24, %4
  %15 = phi i32 [ 1, %4 ], [ %169, %._crit_edge24 ]
  %16 = phi [1000 x double]* [ %2, %4 ], [ %84, %._crit_edge24 ]
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %29, %.preheader1
  %indvars.iv9 = phi i64 [ 1, %.preheader1 ], [ %indvars.iv.next10, %29 ]
  %17 = phi [1000 x double]* [ %16, %.preheader1 ], [ %84, %29 ]
  %18 = load [1000 x double]*, [1000 x double]** %6, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 0, i64 %indvars.iv9
  store double 1.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 %indvars.iv9, i64 0
  store double 0.000000e+00, double* %20, align 8
  %21 = load [1000 x double]*, [1000 x double]** %6, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 0, i64 %indvars.iv9
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = load [1000 x double]*, [1000 x double]** %8, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv9
  %27 = bitcast [1000 x double]* %26 to i64*
  store i64 %24, i64* %27, align 8
  %28 = add nsw i64 %indvars.iv9, -1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %.pre = load double, double* %9, align 8
  %.pre31 = load double, double* %10, align 8
  br label %47

; <label>:29:                                     ; preds = %30
  %exitcond28 = icmp eq i64 %indvars.iv.next10, 999
  br i1 %exitcond28, label %.lr.ph23, label %.lr.ph.us

; <label>:30:                                     ; preds = %30, %._crit_edge.us
  %indvars.iv7 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next8.1, %30 ]
  %31 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %44, %30 ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv9, i64 %indvars.iv7
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %31
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv9, i64 %indvars.iv7
  %36 = load double, double* %35, align 8
  %37 = fadd double %34, %36
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 %indvars.iv7, i64 %indvars.iv9
  store double %37, double* %38, align 8
  %indvars.iv.next8 = add nsw i64 %indvars.iv7, -1
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv9, i64 %indvars.iv.next8
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %37
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv9, i64 %indvars.iv.next8
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 %indvars.iv.next8, i64 %indvars.iv9
  store double %44, double* %45, align 8
  %46 = icmp sgt i64 %indvars.iv.next8, 1
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, -2
  br i1 %46, label %30, label %29

; <label>:47:                                     ; preds = %47, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %47 ], [ 1, %.lr.ph.us ]
  %48 = phi double [ %88, %47 ], [ %.pre31, %.lr.ph.us ]
  %49 = phi double [ %78, %47 ], [ %.pre, %.lr.ph.us ]
  %50 = phi [1000 x double]* [ %84, %47 ], [ %17, %.lr.ph.us ]
  %51 = load double, double* %11, align 8
  %52 = fsub double -0.000000e+00, %51
  %53 = add nsw i64 %indvars.iv, -1
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %indvars.iv9, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fmul double %49, %55
  %57 = fadd double %56, %48
  %58 = fdiv double %52, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %indvars.iv9, i64 %indvars.iv
  store double %58, double* %59, align 8
  %60 = load double, double* %12, align 8
  %61 = load [1000 x double]*, [1000 x double]** %5, align 8
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv, i64 %28
  %63 = bitcast double* %62 to <2 x double>*
  %64 = fmul double %60, 2.000000e+00
  %65 = fadd double %64, 1.000000e+00
  %66 = load <2 x double>, <2 x double>* %63, align 8
  %67 = insertelement <2 x double> undef, double %60, i32 0
  %68 = insertelement <2 x double> %67, double %65, i32 1
  %69 = fmul <2 x double> %66, %68
  %70 = extractelement <2 x double> %69, i32 0
  %71 = extractelement <2 x double> %69, i32 1
  %72 = fsub double %71, %70
  %73 = load double, double* %14, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv, i64 %indvars.iv.next10
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fsub double %72, %76
  %78 = load double, double* %9, align 8
  %79 = load [1000 x double]*, [1000 x double]** %8, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv9, i64 %53
  %81 = load double, double* %80, align 8
  %82 = fmul double %78, %81
  %83 = fsub double %77, %82
  %84 = load [1000 x double]*, [1000 x double]** %7, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv9, i64 %53
  %86 = load double, double* %85, align 8
  %87 = fmul double %78, %86
  %88 = load double, double* %10, align 8
  %89 = fadd double %87, %88
  %90 = fdiv double %83, %89
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv9, i64 %indvars.iv
  store double %90, double* %91, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us, label %47

._crit_edge.us:                                   ; preds = %47
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 999, i64 %indvars.iv9
  store double 1.000000e+00, double* %92, align 8
  br label %30

.lr.ph23:                                         ; preds = %29
  %.pre32 = load double, double* %13, align 8
  %.pre33 = load [1000 x double]*, [1000 x double]** %6, align 8
  %.pre34 = load double, double* %11, align 8
  %93 = fsub double -0.000000e+00, %73
  %94 = fmul double %78, 2.000000e+00
  %95 = fadd double %94, 1.000000e+00
  br label %.lver.check

.lver.check:                                      ; preds = %129, %.lr.ph23
  %indvar = phi i64 [ %96, %129 ], [ 0, %.lr.ph23 ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %129 ], [ 1, %.lr.ph23 ]
  %96 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %84, i64 %96, i64 0
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %84, i64 %96, i64 999
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %79, i64 %96, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %79, i64 %96, i64 999
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv16, i64 0
  store double 1.000000e+00, double* %97, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv16, i64 0
  store double 0.000000e+00, double* %98, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv16
  %100 = bitcast [1000 x double]* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv16
  %103 = bitcast [1000 x double]* %102 to i64*
  store i64 %101, i64* %103, align 8
  %104 = add nsw i64 %indvars.iv16, -1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv11.lver.orig = phi i64 [ %indvars.iv.next12.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %105 = add nsw i64 %indvars.iv11.lver.orig, -1
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv16, i64 %105
  %107 = load double, double* %106, align 8
  %108 = fmul double %60, %107
  %109 = fadd double %108, %.pre32
  %110 = fdiv double %93, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  store double %110, double* %111, align 8
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre33, i64 %104, i64 %indvars.iv11.lver.orig
  %113 = load double, double* %112, align 8
  %114 = fmul double %78, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre33, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  %116 = load double, double* %115, align 8
  %117 = fmul double %95, %116
  %118 = fsub double %117, %114
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre33, i64 %indvars.iv.next17, i64 %indvars.iv11.lver.orig
  %120 = load double, double* %119, align 8
  %121 = fmul double %.pre34, %120
  %122 = fsub double %118, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv16, i64 %105
  %124 = load double, double* %123, align 8
  %125 = fmul double %60, %124
  %126 = fsub double %122, %125
  %127 = fdiv double %126, %109
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  store double %127, double* %128, align 8
  %exitcond13.lver.orig = icmp eq i64 %indvars.iv11.lver.orig, 998
  %indvars.iv.next12.lver.orig = add nuw nsw i64 %indvars.iv11.lver.orig, 1
  br i1 %exitcond13.lver.orig, label %._crit_edge22.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial49 = load double, double* %scevgep43, align 8
  br label %147

; <label>:129:                                    ; preds = %130
  %exitcond29 = icmp eq i64 %indvars.iv.next17, 999
  br i1 %exitcond29, label %._crit_edge24, label %.lver.check

; <label>:130:                                    ; preds = %130, %._crit_edge22.us
  %indvars.iv14 = phi i64 [ 998, %._crit_edge22.us ], [ %indvars.iv.next15.1, %130 ]
  %131 = phi double [ 1.000000e+00, %._crit_edge22.us ], [ %144, %130 ]
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv16, i64 %indvars.iv14
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %131
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv16, i64 %indvars.iv14
  %136 = load double, double* %135, align 8
  %137 = fadd double %134, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv16, i64 %indvars.iv14
  store double %137, double* %138, align 8
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, -1
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv16, i64 %indvars.iv.next15
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, %137
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv16, i64 %indvars.iv.next15
  %143 = load double, double* %142, align 8
  %144 = fadd double %141, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv16, i64 %indvars.iv.next15
  store double %144, double* %145, align 8
  %146 = icmp sgt i64 %indvars.iv.next15, 1
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, -2
  br i1 %146, label %130, label %129

; <label>:147:                                    ; preds = %147, %.ph
  %store_forwarded50 = phi double [ %load_initial49, %.ph ], [ %165, %147 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %150, %147 ]
  %indvars.iv11 = phi i64 [ 1, %.ph ], [ %indvars.iv.next12, %147 ]
  %148 = fmul double %60, %store_forwarded
  %149 = fadd double %148, %.pre32
  %150 = fdiv double %93, %149
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv16, i64 %indvars.iv11
  store double %150, double* %151, align 8
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre33, i64 %104, i64 %indvars.iv11
  %153 = load double, double* %152, align 8
  %154 = fmul double %78, %153
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre33, i64 %indvars.iv16, i64 %indvars.iv11
  %156 = load double, double* %155, align 8
  %157 = fmul double %95, %156
  %158 = fsub double %157, %154
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre33, i64 %indvars.iv.next17, i64 %indvars.iv11
  %160 = load double, double* %159, align 8
  %161 = fmul double %.pre34, %160
  %162 = fsub double %158, %161
  %163 = fmul double %60, %store_forwarded50
  %164 = fsub double %162, %163
  %165 = fdiv double %164, %149
  %166 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv16, i64 %indvars.iv11
  store double %165, double* %166, align 8
  %exitcond13 = icmp eq i64 %indvars.iv11, 998
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond13, label %._crit_edge22.us.loopexit51, label %147

._crit_edge22.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge22.us

._crit_edge22.us.loopexit51:                      ; preds = %147
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit51, %._crit_edge22.us.loopexit
  %167 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv16, i64 999
  store double 1.000000e+00, double* %167, align 8
  br label %130

._crit_edge24:                                    ; preds = %129
  %168 = icmp sgt i32 %15, 499
  %169 = add nuw nsw i32 %15, 1
  br i1 %168, label %170, label %.preheader1

; <label>:170:                                    ; preds = %._crit_edge24
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge1
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge1

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
