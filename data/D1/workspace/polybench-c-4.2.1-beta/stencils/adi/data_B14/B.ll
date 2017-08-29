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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next8, %._crit_edge.us ]
  %2 = trunc i64 %indvars.iv7 to i32
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge11 ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub nuw nsw i32 1000, %3
  %5 = add nuw nsw i32 %4, %2
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 1000, %8
  %10 = add nuw nsw i32 %9, %2
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge11
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca [1000 x double]*, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  store [1000 x double]* %2, [1000 x double]** %6, align 8
  store [1000 x double]* %3, [1000 x double]** %7, align 8
  store [1000 x double]* %4, [1000 x double]** %8, align 8
  store [1000 x double]* %5, [1000 x double]** %9, align 8
  store double 0xC09F400000000001, double* %10, align 8
  store double 0xC09F400000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  store double 0x40AF420000000001, double* %11, align 8
  store double 0x409F440000000001, double* %14, align 8
  store double 0xC08F400000000001, double* %15, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge44..preheader7_crit_edge, %.preheader7.lr.ph
  %16 = phi i32 [ 1, %.preheader7.lr.ph ], [ %150, %._crit_edge44..preheader7_crit_edge ]
  %17 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %76, %._crit_edge44..preheader7_crit_edge ]
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %._crit_edge25.us, %.preheader7
  %indvars.iv75 = phi i64 [ 1, %.preheader7 ], [ %30, %._crit_edge25.us ]
  %18 = phi [1000 x double]* [ %17, %.preheader7 ], [ %76, %._crit_edge25.us ]
  %19 = load [1000 x double]*, [1000 x double]** %7, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv75
  store double 1.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv75, i64 0
  store double 0.000000e+00, double* %21, align 8
  %22 = load [1000 x double]*, [1000 x double]** %7, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 0, i64 %indvars.iv75
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = load [1000 x double]*, [1000 x double]** %9, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv75
  %28 = bitcast [1000 x double]* %27 to i64*
  store i64 %25, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv75, -1
  %30 = add nuw nsw i64 %indvars.iv75, 1
  %.pre = load double, double* %10, align 8
  %.pre59 = load double, double* %11, align 8
  br label %._crit_edge90

._crit_edge25.us:                                 ; preds = %.lr.ph24.us
  %exitcond78 = icmp eq i64 %30, 999
  br i1 %exitcond78, label %.preheader..lr.ph36.us_crit_edge, label %.lr.ph27.split.us

.lr.ph24.us:                                      ; preds = %.lr.ph24.us..lr.ph24.us_crit_edge, %._crit_edge.us
  %31 = phi double [ %37, %.lr.ph24.us..lr.ph24.us_crit_edge ], [ 1.000000e+00, %._crit_edge.us ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %.lr.ph24.us..lr.ph24.us_crit_edge ], [ 998, %._crit_edge.us ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv75, i64 %indvars.iv73
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %31
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv75, i64 %indvars.iv73
  %36 = load double, double* %35, align 8
  %37 = fadd double %34, %36
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv73, i64 %indvars.iv75
  store double %37, double* %38, align 8
  %39 = icmp sgt i64 %indvars.iv73, 1
  br i1 %39, label %.lr.ph24.us..lr.ph24.us_crit_edge, label %._crit_edge25.us

.lr.ph24.us..lr.ph24.us_crit_edge:                ; preds = %.lr.ph24.us
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, -1
  br label %.lr.ph24.us

._crit_edge90:                                    ; preds = %._crit_edge90, %.lr.ph27.split.us
  %indvars.iv69 = phi i64 [ 1, %.lr.ph27.split.us ], [ %indvars.iv.next70, %._crit_edge90 ]
  %40 = phi double [ %.pre59, %.lr.ph27.split.us ], [ %80, %._crit_edge90 ]
  %41 = phi double [ %.pre, %.lr.ph27.split.us ], [ %70, %._crit_edge90 ]
  %42 = phi [1000 x double]* [ %18, %.lr.ph27.split.us ], [ %76, %._crit_edge90 ]
  %43 = load double, double* %12, align 8
  %44 = fsub double -0.000000e+00, %43
  %45 = add nsw i64 %indvars.iv69, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv75, i64 %45
  %47 = load double, double* %46, align 8
  %48 = fmul double %41, %47
  %49 = fadd double %48, %40
  %50 = fdiv double %44, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv75, i64 %indvars.iv69
  store double %50, double* %51, align 8
  %52 = load double, double* %13, align 8
  %53 = load [1000 x double]*, [1000 x double]** %6, align 8
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv69, i64 %29
  %55 = bitcast double* %54 to <2 x double>*
  %56 = fmul double %52, 2.000000e+00
  %57 = fadd double %56, 1.000000e+00
  %58 = load <2 x double>, <2 x double>* %55, align 8
  %59 = insertelement <2 x double> undef, double %52, i32 0
  %60 = insertelement <2 x double> %59, double %57, i32 1
  %61 = fmul <2 x double> %60, %58
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fsub double %63, %62
  %65 = load double, double* %15, align 8
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv69, i64 %30
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fsub double %64, %68
  %70 = load double, double* %10, align 8
  %71 = load [1000 x double]*, [1000 x double]** %9, align 8
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv75, i64 %45
  %73 = load double, double* %72, align 8
  %74 = fmul double %70, %73
  %75 = fsub double %69, %74
  %76 = load [1000 x double]*, [1000 x double]** %8, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv75, i64 %45
  %78 = load double, double* %77, align 8
  %79 = fmul double %70, %78
  %80 = load double, double* %11, align 8
  %81 = fadd double %79, %80
  %82 = fdiv double %75, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv75, i64 %indvars.iv69
  store double %82, double* %83, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 999
  br i1 %exitcond72, label %._crit_edge.us, label %._crit_edge90

._crit_edge.us:                                   ; preds = %._crit_edge90
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv75
  store double 1.000000e+00, double* %84, align 8
  br label %.lr.ph24.us

.preheader..lr.ph36.us_crit_edge:                 ; preds = %._crit_edge25.us
  %.pre98 = load double, double* %14, align 8
  %.pre99 = load [1000 x double]*, [1000 x double]** %7, align 8
  %.pre100 = load double, double* %12, align 8
  %85 = fsub double -0.000000e+00, %65
  %86 = fmul double %70, 2.000000e+00
  %87 = fadd double %86, 1.000000e+00
  br label %._crit_edge91.lver.check

._crit_edge91.lver.check:                         ; preds = %._crit_edge41.us, %.preheader..lr.ph36.us_crit_edge
  %indvar = phi i64 [ 0, %.preheader..lr.ph36.us_crit_edge ], [ %88, %._crit_edge41.us ]
  %indvars.iv85 = phi i64 [ 1, %.preheader..lr.ph36.us_crit_edge ], [ %96, %._crit_edge41.us ]
  %88 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %76, i64 %88, i64 0
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %76, i64 %88, i64 999
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %71, i64 %88, i64 0
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %71, i64 %88, i64 999
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv85, i64 0
  store double 1.000000e+00, double* %89, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv85, i64 0
  store double 0.000000e+00, double* %90, align 8
  %91 = bitcast double* %89 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv85
  %94 = bitcast [1000 x double]* %93 to i64*
  store i64 %92, i64* %94, align 8
  %95 = add nsw i64 %indvars.iv85, -1
  %96 = add nuw nsw i64 %indvars.iv85, 1
  %bound0 = icmp ult double* %scevgep, %scevgep111
  %bound1 = icmp ult double* %scevgep109, %scevgep107
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge91.lver.orig.preheader, label %._crit_edge91.ph

._crit_edge91.lver.orig.preheader:                ; preds = %._crit_edge91.lver.check
  br label %._crit_edge91.lver.orig

._crit_edge91.lver.orig:                          ; preds = %._crit_edge91.lver.orig.preheader, %._crit_edge91.lver.orig
  %indvars.iv79.lver.orig = phi i64 [ %indvars.iv.next80.lver.orig, %._crit_edge91.lver.orig ], [ 1, %._crit_edge91.lver.orig.preheader ]
  %97 = add nsw i64 %indvars.iv79.lver.orig, -1
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv85, i64 %97
  %99 = load double, double* %98, align 8
  %100 = fmul double %52, %99
  %101 = fadd double %100, %.pre98
  %102 = fdiv double %85, %101
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv85, i64 %indvars.iv79.lver.orig
  store double %102, double* %103, align 8
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %95, i64 %indvars.iv79.lver.orig
  %105 = load double, double* %104, align 8
  %106 = fmul double %70, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv85, i64 %indvars.iv79.lver.orig
  %108 = load double, double* %107, align 8
  %109 = fmul double %87, %108
  %110 = fsub double %109, %106
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %96, i64 %indvars.iv79.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %.pre100, %112
  %114 = fsub double %110, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv85, i64 %97
  %116 = load double, double* %115, align 8
  %117 = fmul double %52, %116
  %118 = fsub double %114, %117
  %119 = fdiv double %118, %101
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv85, i64 %indvars.iv79.lver.orig
  store double %119, double* %120, align 8
  %indvars.iv.next80.lver.orig = add nuw nsw i64 %indvars.iv79.lver.orig, 1
  %exitcond82.lver.orig = icmp eq i64 %indvars.iv.next80.lver.orig, 999
  br i1 %exitcond82.lver.orig, label %._crit_edge37.us.loopexit, label %._crit_edge91.lver.orig

._crit_edge91.ph:                                 ; preds = %._crit_edge91.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial115 = load double, double* %scevgep109, align 8
  br label %._crit_edge91

._crit_edge41.us:                                 ; preds = %.lr.ph40.us
  %exitcond88 = icmp eq i64 %96, 999
  br i1 %exitcond88, label %._crit_edge44, label %._crit_edge91.lver.check

.lr.ph40.us:                                      ; preds = %.lr.ph40.us..lr.ph40.us_crit_edge, %._crit_edge37.us
  %121 = phi double [ %127, %.lr.ph40.us..lr.ph40.us_crit_edge ], [ 1.000000e+00, %._crit_edge37.us ]
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %.lr.ph40.us..lr.ph40.us_crit_edge ], [ 998, %._crit_edge37.us ]
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv85, i64 %indvars.iv83
  %123 = load double, double* %122, align 8
  %124 = fmul double %123, %121
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv85, i64 %indvars.iv83
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv85, i64 %indvars.iv83
  store double %127, double* %128, align 8
  %129 = icmp sgt i64 %indvars.iv83, 1
  br i1 %129, label %.lr.ph40.us..lr.ph40.us_crit_edge, label %._crit_edge41.us

.lr.ph40.us..lr.ph40.us_crit_edge:                ; preds = %.lr.ph40.us
  %indvars.iv.next84 = add nsw i64 %indvars.iv83, -1
  br label %.lr.ph40.us

._crit_edge91:                                    ; preds = %._crit_edge91, %._crit_edge91.ph
  %store_forwarded116 = phi double [ %load_initial115, %._crit_edge91.ph ], [ %147, %._crit_edge91 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge91.ph ], [ %132, %._crit_edge91 ]
  %indvars.iv79 = phi i64 [ 1, %._crit_edge91.ph ], [ %indvars.iv.next80, %._crit_edge91 ]
  %130 = fmul double %52, %store_forwarded
  %131 = fadd double %130, %.pre98
  %132 = fdiv double %85, %131
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 %indvars.iv85, i64 %indvars.iv79
  store double %132, double* %133, align 8
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %95, i64 %indvars.iv79
  %135 = load double, double* %134, align 8
  %136 = fmul double %70, %135
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv85, i64 %indvars.iv79
  %138 = load double, double* %137, align 8
  %139 = fmul double %87, %138
  %140 = fsub double %139, %136
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %96, i64 %indvars.iv79
  %142 = load double, double* %141, align 8
  %143 = fmul double %.pre100, %142
  %144 = fsub double %140, %143
  %145 = fmul double %52, %store_forwarded116
  %146 = fsub double %144, %145
  %147 = fdiv double %146, %131
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %indvars.iv85, i64 %indvars.iv79
  store double %147, double* %148, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 999
  br i1 %exitcond82, label %._crit_edge37.us.loopexit128, label %._crit_edge91

._crit_edge37.us.loopexit:                        ; preds = %._crit_edge91.lver.orig
  br label %._crit_edge37.us

._crit_edge37.us.loopexit128:                     ; preds = %._crit_edge91
  br label %._crit_edge37.us

._crit_edge37.us:                                 ; preds = %._crit_edge37.us.loopexit128, %._crit_edge37.us.loopexit
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %indvars.iv85, i64 999
  store double 1.000000e+00, double* %149, align 8
  br label %.lr.ph40.us

._crit_edge44:                                    ; preds = %._crit_edge41.us
  %exitcond89 = icmp eq i32 %16, 500
  br i1 %exitcond89, label %._crit_edge, label %._crit_edge44..preheader7_crit_edge

._crit_edge44..preheader7_crit_edge:              ; preds = %._crit_edge44
  %150 = add nuw nsw i32 %16, 1
  br label %.preheader7

._crit_edge:                                      ; preds = %._crit_edge44
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv6, 1000
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge10 ]
  %7 = add nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10

; <label>:11:                                     ; preds = %._crit_edge11
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge11, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge10
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
