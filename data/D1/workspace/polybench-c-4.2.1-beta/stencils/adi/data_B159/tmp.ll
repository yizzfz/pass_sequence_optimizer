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
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %2, %15
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

.preheader:                                       ; preds = %16, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %16 ]
  br label %2

; <label>:2:                                      ; preds = %2, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %2 ]
  %3 = sub nuw nsw i64 1000, %indvars.iv
  %4 = add nuw nsw i64 %3, %indvars.iv1
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub i64 999, %indvars.iv
  %9 = add nuw nsw i64 %8, %indvars.iv1
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %16, label %2

; <label>:16:                                     ; preds = %2
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %17, label %.preheader

; <label>:17:                                     ; preds = %16
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
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge32, %4
  %15 = phi [1000 x double]* [ %1, %4 ], [ %168, %._crit_edge32 ]
  %16 = phi i32 [ 1, %4 ], [ %173, %._crit_edge32 ]
  %17 = phi [1000 x double]* [ %2, %4 ], [ %138, %._crit_edge32 ]
  br label %.lr.ph

.lver.check:                                      ; preds = %50, %.lr.ph31.split.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph31.split.us.preheader ], [ %18, %50 ]
  %indvars.iv16 = phi i64 [ 1, %.lr.ph31.split.us.preheader ], [ %indvars.iv.next17, %50 ]
  %18 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %138, i64 %18, i64 0
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %138, i64 %18, i64 999
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %133, i64 %18, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %133, i64 %18, i64 999
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %115, i64 %indvars.iv16, i64 0
  store double 1.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv16, i64 0
  store double 0.000000e+00, double* %20, align 8
  %21 = bitcast double* %19 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv16
  %24 = bitcast [1000 x double]* %23 to i64*
  store i64 %22, i64* %24, align 8
  %25 = add nsw i64 %indvars.iv16, -1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv11.lver.orig = phi i64 [ %indvars.iv.next12.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %26 = add nsw i64 %indvars.iv11.lver.orig, -1
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv16, i64 %26
  %28 = load double, double* %27, align 8
  %29 = fmul double %114, %28
  %30 = fadd double %29, %167
  %31 = fdiv double %166, %30
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %168, i64 %25, i64 %indvars.iv11.lver.orig
  %34 = load double, double* %33, align 8
  %35 = fmul double %132, %34
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %168, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  %37 = load double, double* %36, align 8
  %38 = fmul double %170, %37
  %39 = fsub double %38, %35
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %168, i64 %indvars.iv.next17, i64 %indvars.iv11.lver.orig
  %41 = load double, double* %40, align 8
  %42 = fmul double %171, %41
  %43 = fsub double %39, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv16, i64 %26
  %45 = load double, double* %44, align 8
  %46 = fmul double %114, %45
  %47 = fsub double %43, %46
  %48 = fdiv double %47, %30
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv16, i64 %indvars.iv11.lver.orig
  store double %48, double* %49, align 8
  %exitcond13.lver.orig = icmp eq i64 %indvars.iv11.lver.orig, 998
  %indvars.iv.next12.lver.orig = add nuw nsw i64 %indvars.iv11.lver.orig, 1
  br i1 %exitcond13.lver.orig, label %._crit_edge30.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial49 = load double, double* %scevgep43, align 8
  br label %68

; <label>:50:                                     ; preds = %51
  %exitcond29 = icmp eq i64 %indvars.iv.next17, 999
  br i1 %exitcond29, label %._crit_edge32, label %.lver.check

; <label>:51:                                     ; preds = %51, %._crit_edge30.us
  %indvars.iv14 = phi i64 [ 998, %._crit_edge30.us ], [ %indvars.iv.next15.1, %51 ]
  %52 = phi double [ 1.000000e+00, %._crit_edge30.us ], [ %65, %51 ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv16, i64 %indvars.iv14
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %52
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv16, i64 %indvars.iv14
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %115, i64 %indvars.iv16, i64 %indvars.iv14
  store double %58, double* %59, align 8
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, -1
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv16, i64 %indvars.iv.next15
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %58
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv16, i64 %indvars.iv.next15
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %115, i64 %indvars.iv16, i64 %indvars.iv.next15
  store double %65, double* %66, align 8
  %67 = icmp sgt i64 %indvars.iv.next15, 1
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, -2
  br i1 %67, label %51, label %50

; <label>:68:                                     ; preds = %68, %.ph
  %store_forwarded50 = phi double [ %load_initial49, %.ph ], [ %86, %68 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %71, %68 ]
  %indvars.iv11 = phi i64 [ 1, %.ph ], [ %indvars.iv.next12, %68 ]
  %69 = fmul double %114, %store_forwarded
  %70 = fadd double %69, %167
  %71 = fdiv double %166, %70
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv16, i64 %indvars.iv11
  store double %71, double* %72, align 8
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %168, i64 %25, i64 %indvars.iv11
  %74 = load double, double* %73, align 8
  %75 = fmul double %132, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %168, i64 %indvars.iv16, i64 %indvars.iv11
  %77 = load double, double* %76, align 8
  %78 = fmul double %170, %77
  %79 = fsub double %78, %75
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %168, i64 %indvars.iv.next17, i64 %indvars.iv11
  %81 = load double, double* %80, align 8
  %82 = fmul double %171, %81
  %83 = fsub double %79, %82
  %84 = fmul double %114, %store_forwarded50
  %85 = fsub double %83, %84
  %86 = fdiv double %85, %70
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv16, i64 %indvars.iv11
  store double %86, double* %87, align 8
  %exitcond13 = icmp eq i64 %indvars.iv11, 998
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond13, label %._crit_edge30.us.loopexit51, label %68

._crit_edge30.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge30.us

._crit_edge30.us.loopexit51:                      ; preds = %68
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.loopexit51, %._crit_edge30.us.loopexit
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %115, i64 %indvars.iv16, i64 999
  store double 1.000000e+00, double* %88, align 8
  br label %51

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.preheader7
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %..lr.ph_crit_edge ], [ 1, %.preheader7 ]
  %89 = phi [1000 x double]* [ %.pre, %..lr.ph_crit_edge ], [ %15, %.preheader7 ]
  %90 = phi [1000 x double]* [ %138, %..lr.ph_crit_edge ], [ %17, %.preheader7 ]
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 0, i64 %indvars.iv9
  store double 1.000000e+00, double* %91, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %90, i64 %indvars.iv9, i64 0
  store double 0.000000e+00, double* %92, align 8
  %93 = load [1000 x double]*, [1000 x double]** %6, align 8
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %93, i64 0, i64 %indvars.iv9
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = load [1000 x double]*, [1000 x double]** %8, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %indvars.iv9
  %99 = bitcast [1000 x double]* %98 to i64*
  store i64 %96, i64* %99, align 8
  %100 = add nsw i64 %indvars.iv9, -1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %.pre41 = load double, double* %9, align 8
  %.pre42 = load double, double* %10, align 8
  br label %101

; <label>:101:                                    ; preds = %101, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %101 ], [ 1, %.lr.ph ]
  %102 = phi double [ %142, %101 ], [ %.pre42, %.lr.ph ]
  %103 = phi double [ %132, %101 ], [ %.pre41, %.lr.ph ]
  %104 = phi [1000 x double]* [ %138, %101 ], [ %90, %.lr.ph ]
  %105 = load double, double* %11, align 8
  %106 = fsub double -0.000000e+00, %105
  %107 = add nsw i64 %indvars.iv, -1
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %104, i64 %indvars.iv9, i64 %107
  %109 = load double, double* %108, align 8
  %110 = fmul double %103, %109
  %111 = fadd double %110, %102
  %112 = fdiv double %106, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %104, i64 %indvars.iv9, i64 %indvars.iv
  store double %112, double* %113, align 8
  %114 = load double, double* %12, align 8
  %115 = load [1000 x double]*, [1000 x double]** %5, align 8
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %115, i64 %indvars.iv, i64 %100
  %117 = bitcast double* %116 to <2 x double>*
  %118 = fmul double %114, 2.000000e+00
  %119 = fadd double %118, 1.000000e+00
  %120 = load <2 x double>, <2 x double>* %117, align 8
  %121 = insertelement <2 x double> undef, double %114, i32 0
  %122 = insertelement <2 x double> %121, double %119, i32 1
  %123 = fmul <2 x double> %122, %120
  %124 = extractelement <2 x double> %123, i32 0
  %125 = extractelement <2 x double> %123, i32 1
  %126 = fsub double %125, %124
  %127 = load double, double* %14, align 8
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %115, i64 %indvars.iv, i64 %indvars.iv.next10
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fsub double %126, %130
  %132 = load double, double* %9, align 8
  %133 = load [1000 x double]*, [1000 x double]** %8, align 8
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv9, i64 %107
  %135 = load double, double* %134, align 8
  %136 = fmul double %132, %135
  %137 = fsub double %131, %136
  %138 = load [1000 x double]*, [1000 x double]** %7, align 8
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv9, i64 %107
  %140 = load double, double* %139, align 8
  %141 = fmul double %132, %140
  %142 = load double, double* %10, align 8
  %143 = fadd double %141, %142
  %144 = fdiv double %137, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv9, i64 %indvars.iv
  store double %144, double* %145, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge, label %101

._crit_edge:                                      ; preds = %101
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %93, i64 999, i64 %indvars.iv9
  store double 1.000000e+00, double* %146, align 8
  br label %147

; <label>:147:                                    ; preds = %147, %._crit_edge
  %indvars.iv7 = phi i64 [ 998, %._crit_edge ], [ %indvars.iv.next8.1, %147 ]
  %148 = phi double [ 1.000000e+00, %._crit_edge ], [ %161, %147 ]
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv9, i64 %indvars.iv7
  %150 = load double, double* %149, align 8
  %151 = fmul double %150, %148
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv9, i64 %indvars.iv7
  %153 = load double, double* %152, align 8
  %154 = fadd double %151, %153
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %93, i64 %indvars.iv7, i64 %indvars.iv9
  store double %154, double* %155, align 8
  %indvars.iv.next8 = add nsw i64 %indvars.iv7, -1
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %indvars.iv9, i64 %indvars.iv.next8
  %157 = load double, double* %156, align 8
  %158 = fmul double %157, %154
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %indvars.iv9, i64 %indvars.iv.next8
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %93, i64 %indvars.iv.next8, i64 %indvars.iv9
  store double %161, double* %162, align 8
  %163 = icmp sgt i64 %indvars.iv.next8, 1
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, -2
  br i1 %163, label %147, label %164

; <label>:164:                                    ; preds = %147
  %165 = icmp slt i64 %indvars.iv.next10, 999
  br i1 %165, label %..lr.ph_crit_edge, label %.lr.ph31.split.us.preheader

.lr.ph31.split.us.preheader:                      ; preds = %164
  %166 = fsub double -0.000000e+00, %127
  %167 = load double, double* %13, align 8
  %168 = load [1000 x double]*, [1000 x double]** %6, align 8
  %169 = fmul double %132, 2.000000e+00
  %170 = fadd double %169, 1.000000e+00
  %171 = load double, double* %11, align 8
  br label %.lver.check

..lr.ph_crit_edge:                                ; preds = %164
  %.pre = load [1000 x double]*, [1000 x double]** %6, align 8
  br label %.lr.ph

._crit_edge32:                                    ; preds = %50
  %172 = icmp sgt i32 %16, 499
  %173 = add nuw nsw i32 %16, 1
  br i1 %172, label %174, label %.preheader7

; <label>:174:                                    ; preds = %._crit_edge32
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

.preheader:                                       ; preds = %19, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
