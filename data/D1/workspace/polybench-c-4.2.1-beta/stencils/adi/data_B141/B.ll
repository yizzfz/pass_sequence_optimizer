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
  call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %16

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %._crit_edge1, %._crit_edge, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader.lr.ph, label %..loopexit2_crit_edge

..loopexit2_crit_edge:                            ; preds = %2
  br label %.loopexit2

.preheader.lr.ph:                                 ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.lr.ph
  %3 = phi i32 [ 0, %.preheader.lr.ph ], [ %17, %.loopexit.us..preheader.us_crit_edge ]
  %4 = add nsw i32 %3, 1000
  %5 = sext i32 %3 to i64
  br i1 true, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit..loopexit.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit..loopexit.us_crit_edge:            ; preds = %.prol.loopexit
  br label %.loopexit.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = sub i32 %4, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %11 = sub i32 %4, %10
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.000000e+03, double 1.000000e+03>
  %16 = bitcast double* %9 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond4.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond4.1, label %.loopexit.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

.loopexit.us.loopexit:                            ; preds = %.preheader.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.prol.loopexit..loopexit.us_crit_edge, %.loopexit.us.loopexit
  %17 = add nsw i32 %3, 1
  %18 = icmp slt i32 %17, 1000
  br i1 %18, label %.loopexit.us..preheader.us_crit_edge, label %.loopexit2.loopexit

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit2.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %..loopexit2_crit_edge, %.loopexit2.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca [1000 x double]*, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [1000 x double]*, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  store [1000 x double]* %2, [1000 x double]** %7, align 8
  store [1000 x double]* %3, [1000 x double]** %8, align 8
  store [1000 x double]* %4, [1000 x double]** %9, align 8
  store [1000 x double]* %5, [1000 x double]** %10, align 8
  store double 0xC09F400000000001, double* %11, align 8
  store double 0xC09F400000000001, double* %13, align 8
  store double 0xC08F400000000001, double* %14, align 8
  store double 0x40AF420000000001, double* %12, align 8
  store double 0x409F440000000001, double* %15, align 8
  store double 0xC08F400000000001, double* %16, align 8
  br i1 false, label %..loopexit39_crit_edge, label %.preheader1.lr.ph

..loopexit39_crit_edge:                           ; preds = %6
  br label %.loopexit39

.preheader1.lr.ph:                                ; preds = %6
  br label %.preheader1

.preheader1:                                      ; preds = %.loopexit38..preheader1_crit_edge, %.preheader1.lr.ph
  %17 = phi i32 [ 1, %.preheader1.lr.ph ], [ %193, %.loopexit38..preheader1_crit_edge ]
  %18 = phi [1000 x double]* [ %4, %.preheader1.lr.ph ], [ %.lcssa10, %.loopexit38..preheader1_crit_edge ]
  %19 = phi [1000 x double]* [ %4, %.preheader1.lr.ph ], [ %.lcssa11, %.loopexit38..preheader1_crit_edge ]
  br i1 true, label %.lr.ph18.split.us.preheader, label %.preheader1..loopexit38_crit_edge

.preheader1..loopexit38_crit_edge:                ; preds = %.preheader1
  br label %.loopexit38

.lr.ph18.split.us.preheader:                      ; preds = %.preheader1
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.loopexit36.us..lr.ph18.split.us_crit_edge, %.lr.ph18.split.us.preheader
  %20 = phi i32 [ %99, %.loopexit36.us..lr.ph18.split.us_crit_edge ], [ 1, %.lr.ph18.split.us.preheader ]
  %21 = phi [1000 x double]* [ %73, %.loopexit36.us..lr.ph18.split.us_crit_edge ], [ %18, %.lr.ph18.split.us.preheader ]
  %22 = phi [1000 x double]* [ %73, %.loopexit36.us..lr.ph18.split.us_crit_edge ], [ %19, %.lr.ph18.split.us.preheader ]
  %23 = load [1000 x double]*, [1000 x double]** %8, align 8
  %24 = sext i32 %20 to i64
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 0, i64 %24
  store double 1.000000e+00, double* %25, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 %24, i64 0
  store double 0.000000e+00, double* %26, align 8
  %27 = load [1000 x double]*, [1000 x double]** %8, align 8
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 0, i64 %24
  %29 = bitcast double* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = load [1000 x double]*, [1000 x double]** %10, align 8
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %24
  %33 = bitcast [1000 x double]* %32 to i64*
  store i64 %30, i64* %33, align 8
  %34 = add nsw i64 %24, -1
  %35 = add nsw i64 %24, 1
  %.pre = load double, double* %11, align 8
  %.pre79 = load double, double* %12, align 8
  br label %36

; <label>:36:                                     ; preds = %._crit_edge, %.lr.ph18.split.us
  %37 = phi double [ %77, %._crit_edge ], [ %.pre79, %.lr.ph18.split.us ]
  %38 = phi double [ %67, %._crit_edge ], [ %.pre, %.lr.ph18.split.us ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge ], [ 1, %.lr.ph18.split.us ]
  %39 = phi [1000 x double]* [ %73, %._crit_edge ], [ %22, %.lr.ph18.split.us ]
  %40 = load double, double* %13, align 8
  %41 = fsub double -0.000000e+00, %40
  %42 = add nsw i64 %indvars.iv55, -1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %24, i64 %42
  %44 = load double, double* %43, align 8
  %45 = fmul double %38, %44
  %46 = fadd double %45, %37
  %47 = fdiv double %41, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %24, i64 %indvars.iv55
  store double %47, double* %48, align 8
  %49 = load double, double* %14, align 8
  %50 = load [1000 x double]*, [1000 x double]** %7, align 8
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %indvars.iv55, i64 %34
  %52 = bitcast double* %51 to <2 x double>*
  %53 = fmul double %49, 2.000000e+00
  %54 = fadd double %53, 1.000000e+00
  %55 = load <2 x double>, <2 x double>* %52, align 8
  %56 = insertelement <2 x double> undef, double %49, i32 0
  %57 = insertelement <2 x double> %56, double %54, i32 1
  %58 = fmul <2 x double> %57, %55
  %59 = extractelement <2 x double> %58, i32 0
  %60 = extractelement <2 x double> %58, i32 1
  %61 = fsub double %60, %59
  %62 = load double, double* %16, align 8
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %indvars.iv55, i64 %35
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %61, %65
  %67 = load double, double* %11, align 8
  %68 = load [1000 x double]*, [1000 x double]** %10, align 8
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %24, i64 %42
  %70 = load double, double* %69, align 8
  %71 = fmul double %67, %70
  %72 = fsub double %66, %71
  %73 = load [1000 x double]*, [1000 x double]** %9, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %73, i64 %24, i64 %42
  %75 = load double, double* %74, align 8
  %76 = fmul double %67, %75
  %77 = load double, double* %12, align 8
  %78 = fadd double %76, %77
  %79 = fdiv double %72, %78
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %24, i64 %indvars.iv55
  store double %79, double* %80, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 999
  br i1 %exitcond58, label %.loopexit37.us, label %._crit_edge

._crit_edge:                                      ; preds = %36
  br label %36

.lr.ph16.us:                                      ; preds = %.lr.ph16.us..lr.ph16.us_crit_edge, %.lr.ph16.us.preheader100
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.1, %.lr.ph16.us..lr.ph16.us_crit_edge ], [ %indvars.iv59.unr.ph, %.lr.ph16.us.preheader100 ]
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %73, i64 %24, i64 %indvars.iv59
  %82 = load double, double* %81, align 8
  %83 = add nsw i64 %indvars.iv59, 1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %83, i64 %24
  %85 = load double, double* %84, align 8
  %86 = fmul double %82, %85
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %24, i64 %indvars.iv59
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %indvars.iv59, i64 %24
  store double %89, double* %90, align 8
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, -1
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %73, i64 %24, i64 %indvars.iv.next60
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, %89
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %24, i64 %indvars.iv.next60
  %95 = load double, double* %94, align 8
  %96 = fadd double %93, %95
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %indvars.iv.next60, i64 %24
  store double %96, double* %97, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, -2
  %98 = icmp sgt i64 %indvars.iv.next60, 1
  br i1 %98, label %.lr.ph16.us..lr.ph16.us_crit_edge, label %.loopexit36.us.loopexit

.lr.ph16.us..lr.ph16.us_crit_edge:                ; preds = %.lr.ph16.us
  br label %.lr.ph16.us

.loopexit36.us.loopexit:                          ; preds = %.lr.ph16.us
  br label %.loopexit36.us

.loopexit36.us:                                   ; preds = %.lr.ph16.us.prol.loopexit..loopexit36.us_crit_edge, %.loopexit37.us..loopexit36.us_crit_edge, %.loopexit36.us.loopexit
  %99 = add nsw i32 %20, 1
  %100 = icmp slt i32 %99, 999
  br i1 %100, label %.loopexit36.us..lr.ph18.split.us_crit_edge, label %.lver.check.preheader

.loopexit36.us..lr.ph18.split.us_crit_edge:       ; preds = %.loopexit36.us
  br label %.lr.ph18.split.us

.lver.check.preheader:                            ; preds = %.loopexit36.us
  br label %.lver.check

.loopexit37.us:                                   ; preds = %36
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 999, i64 %24
  store double 1.000000e+00, double* %101, align 8
  br i1 true, label %.lr.ph16.us.preheader, label %.loopexit37.us..loopexit36.us_crit_edge

.loopexit37.us..loopexit36.us_crit_edge:          ; preds = %.loopexit37.us
  br label %.loopexit36.us

.lr.ph16.us.preheader:                            ; preds = %.loopexit37.us
  br i1 true, label %.lr.ph16.us.preheader..lr.ph16.us.prol.loopexit_crit_edge, label %.lr.ph16.us.prol

.lr.ph16.us.preheader..lr.ph16.us.prol.loopexit_crit_edge: ; preds = %.lr.ph16.us.preheader
  br label %.lr.ph16.us.prol.loopexit

.lr.ph16.us.prol:                                 ; preds = %.lr.ph16.us.preheader
  br label %.lr.ph16.us.prol.loopexit

.lr.ph16.us.prol.loopexit:                        ; preds = %.lr.ph16.us.preheader..lr.ph16.us.prol.loopexit_crit_edge, %.lr.ph16.us.prol
  %indvars.iv59.unr.ph = phi i64 [ 997, %.lr.ph16.us.prol ], [ 998, %.lr.ph16.us.preheader..lr.ph16.us.prol.loopexit_crit_edge ]
  br i1 false, label %.lr.ph16.us.prol.loopexit..loopexit36.us_crit_edge, label %.lr.ph16.us.preheader100

.lr.ph16.us.prol.loopexit..loopexit36.us_crit_edge: ; preds = %.lr.ph16.us.prol.loopexit
  br label %.loopexit36.us

.lr.ph16.us.preheader100:                         ; preds = %.lr.ph16.us.prol.loopexit
  br label %.lr.ph16.us

.lver.check:                                      ; preds = %.loopexit.us..lver.check_crit_edge, %.lver.check.preheader
  %indvar = phi i64 [ %indvar.next, %.loopexit.us..lver.check_crit_edge ], [ 0, %.lver.check.preheader ]
  %102 = phi i32 [ %190, %.loopexit.us..lver.check_crit_edge ], [ 1, %.lver.check.preheader ]
  %103 = phi [1000 x double]* [ %110, %.loopexit.us..lver.check_crit_edge ], [ %50, %.lver.check.preheader ]
  %104 = add i64 %indvar, 1
  %105 = add i64 %indvar, 1
  %106 = sext i32 %102 to i64
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %106, i64 0
  store double 1.000000e+00, double* %107, align 8
  %108 = load [1000 x double]*, [1000 x double]** %9, align 8
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %106, i64 0
  store double 0.000000e+00, double* %109, align 8
  %110 = load [1000 x double]*, [1000 x double]** %7, align 8
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %110, i64 %106
  %112 = bitcast [1000 x double]* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = load [1000 x double]*, [1000 x double]** %10, align 8
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %106
  %116 = bitcast [1000 x double]* %115 to i64*
  store i64 %113, i64* %116, align 8
  %117 = load double, double* %16, align 8
  %118 = fsub double -0.000000e+00, %117
  %119 = load double, double* %14, align 8
  %120 = load double, double* %15, align 8
  %121 = load double, double* %11, align 8
  %122 = load [1000 x double]*, [1000 x double]** %8, align 8
  %123 = add nsw i64 %106, -1
  %124 = fmul double %121, 2.000000e+00
  %125 = fadd double %124, 1.000000e+00
  %126 = load double, double* %13, align 8
  %127 = add nsw i64 %106, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %108, i64 %105, i64 0
  %scevgep88 = getelementptr [1000 x double], [1000 x double]* %108, i64 %105, i64 999
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %114, i64 %105, i64 0
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %114, i64 %105, i64 999
  %bound0 = icmp ult double* %scevgep, %scevgep92
  %bound1 = icmp ult double* %scevgep90, %scevgep88
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.ph.lver.orig.preheader
  %indvars.iv63.lver.orig = phi i64 [ %indvars.iv.next64.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.ph.lver.orig.preheader ]
  %128 = add nsw i64 %indvars.iv63.lver.orig, -1
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %106, i64 %128
  %130 = load double, double* %129, align 8
  %131 = fmul double %119, %130
  %132 = fadd double %131, %120
  %133 = fdiv double %118, %132
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %106, i64 %indvars.iv63.lver.orig
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %122, i64 %123, i64 %indvars.iv63.lver.orig
  %136 = load double, double* %135, align 8
  %137 = fmul double %121, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %122, i64 %106, i64 %indvars.iv63.lver.orig
  %139 = load double, double* %138, align 8
  %140 = fmul double %125, %139
  %141 = fsub double %140, %137
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %122, i64 %127, i64 %indvars.iv63.lver.orig
  %143 = load double, double* %142, align 8
  %144 = fmul double %126, %143
  %145 = fsub double %141, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %106, i64 %128
  %147 = load double, double* %146, align 8
  %148 = fmul double %119, %147
  %149 = fsub double %145, %148
  %150 = fdiv double %149, %132
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %106, i64 %indvars.iv63.lver.orig
  store double %150, double* %151, align 8
  %indvars.iv.next64.lver.orig = add nuw nsw i64 %indvars.iv63.lver.orig, 1
  %exitcond66.lver.orig = icmp eq i64 %indvars.iv.next64.lver.orig, 999
  br i1 %exitcond66.lver.orig, label %.loopexit35.us.loopexit, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %108, i64 %104, i64 0
  %load_initial = load double, double* %scevgep94, align 8
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %114, i64 %104, i64 0
  %load_initial96 = load double, double* %scevgep95, align 8
  br label %152

; <label>:152:                                    ; preds = %._crit_edge107, %.ph
  %store_forwarded97 = phi double [ %load_initial96, %.ph ], [ %170, %._crit_edge107 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %155, %._crit_edge107 ]
  %indvars.iv63 = phi i64 [ 1, %.ph ], [ %indvars.iv.next64, %._crit_edge107 ]
  %153 = fmul double %119, %store_forwarded
  %154 = fadd double %153, %120
  %155 = fdiv double %118, %154
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %106, i64 %indvars.iv63
  store double %155, double* %156, align 8
  %157 = getelementptr inbounds [1000 x double], [1000 x double]* %122, i64 %123, i64 %indvars.iv63
  %158 = load double, double* %157, align 8
  %159 = fmul double %121, %158
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %122, i64 %106, i64 %indvars.iv63
  %161 = load double, double* %160, align 8
  %162 = fmul double %125, %161
  %163 = fsub double %162, %159
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %122, i64 %127, i64 %indvars.iv63
  %165 = load double, double* %164, align 8
  %166 = fmul double %126, %165
  %167 = fsub double %163, %166
  %168 = fmul double %119, %store_forwarded97
  %169 = fsub double %167, %168
  %170 = fdiv double %169, %154
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %106, i64 %indvars.iv63
  store double %170, double* %171, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 999
  br i1 %exitcond66, label %.loopexit35.us.loopexit99, label %._crit_edge107

._crit_edge107:                                   ; preds = %152
  br label %152

.lr.ph27.us:                                      ; preds = %.lr.ph27.us..lr.ph27.us_crit_edge, %.lr.ph27.us.preheader98
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %.lr.ph27.us..lr.ph27.us_crit_edge ], [ %indvars.iv67.unr.ph, %.lr.ph27.us.preheader98 ]
  %172 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %106, i64 %indvars.iv67
  %173 = load double, double* %172, align 8
  %174 = add nsw i64 %indvars.iv67, 1
  %175 = getelementptr inbounds [1000 x double], [1000 x double]* %110, i64 %106, i64 %174
  %176 = load double, double* %175, align 8
  %177 = fmul double %173, %176
  %178 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %106, i64 %indvars.iv67
  %179 = load double, double* %178, align 8
  %180 = fadd double %177, %179
  %181 = getelementptr inbounds [1000 x double], [1000 x double]* %110, i64 %106, i64 %indvars.iv67
  store double %180, double* %181, align 8
  %indvars.iv.next68 = add nsw i64 %indvars.iv67, -1
  %182 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %106, i64 %indvars.iv.next68
  %183 = load double, double* %182, align 8
  %184 = fmul double %183, %180
  %185 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %106, i64 %indvars.iv.next68
  %186 = load double, double* %185, align 8
  %187 = fadd double %184, %186
  %188 = getelementptr inbounds [1000 x double], [1000 x double]* %110, i64 %106, i64 %indvars.iv.next68
  store double %187, double* %188, align 8
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, -2
  %189 = icmp sgt i64 %indvars.iv.next68, 1
  br i1 %189, label %.lr.ph27.us..lr.ph27.us_crit_edge, label %.loopexit.us.loopexit

.lr.ph27.us..lr.ph27.us_crit_edge:                ; preds = %.lr.ph27.us
  br label %.lr.ph27.us

.loopexit.us.loopexit:                            ; preds = %.lr.ph27.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.lr.ph27.us.prol.loopexit..loopexit.us_crit_edge, %.loopexit35.us..loopexit.us_crit_edge, %.loopexit.us.loopexit
  %190 = add nsw i32 %102, 1
  %191 = icmp slt i32 %190, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %191, label %.loopexit.us..lver.check_crit_edge, label %.loopexit38.loopexit

.loopexit.us..lver.check_crit_edge:               ; preds = %.loopexit.us
  br label %.lver.check

.loopexit35.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %.loopexit35.us

.loopexit35.us.loopexit99:                        ; preds = %152
  br label %.loopexit35.us

.loopexit35.us:                                   ; preds = %.loopexit35.us.loopexit99, %.loopexit35.us.loopexit
  %192 = getelementptr inbounds [1000 x double], [1000 x double]* %110, i64 %106, i64 999
  store double 1.000000e+00, double* %192, align 8
  br i1 true, label %.lr.ph27.us.preheader, label %.loopexit35.us..loopexit.us_crit_edge

.loopexit35.us..loopexit.us_crit_edge:            ; preds = %.loopexit35.us
  br label %.loopexit.us

.lr.ph27.us.preheader:                            ; preds = %.loopexit35.us
  br i1 true, label %.lr.ph27.us.preheader..lr.ph27.us.prol.loopexit_crit_edge, label %.lr.ph27.us.prol

.lr.ph27.us.preheader..lr.ph27.us.prol.loopexit_crit_edge: ; preds = %.lr.ph27.us.preheader
  br label %.lr.ph27.us.prol.loopexit

.lr.ph27.us.prol:                                 ; preds = %.lr.ph27.us.preheader
  br label %.lr.ph27.us.prol.loopexit

.lr.ph27.us.prol.loopexit:                        ; preds = %.lr.ph27.us.preheader..lr.ph27.us.prol.loopexit_crit_edge, %.lr.ph27.us.prol
  %indvars.iv67.unr.ph = phi i64 [ 997, %.lr.ph27.us.prol ], [ 998, %.lr.ph27.us.preheader..lr.ph27.us.prol.loopexit_crit_edge ]
  br i1 false, label %.lr.ph27.us.prol.loopexit..loopexit.us_crit_edge, label %.lr.ph27.us.preheader98

.lr.ph27.us.prol.loopexit..loopexit.us_crit_edge: ; preds = %.lr.ph27.us.prol.loopexit
  br label %.loopexit.us

.lr.ph27.us.preheader98:                          ; preds = %.lr.ph27.us.prol.loopexit
  br label %.lr.ph27.us

.loopexit38.loopexit:                             ; preds = %.loopexit.us
  br label %.loopexit38

.loopexit38:                                      ; preds = %.preheader1..loopexit38_crit_edge, %.loopexit38.loopexit
  %.lcssa11 = phi [1000 x double]* [ %19, %.preheader1..loopexit38_crit_edge ], [ %108, %.loopexit38.loopexit ]
  %.lcssa10 = phi [1000 x double]* [ %18, %.preheader1..loopexit38_crit_edge ], [ %108, %.loopexit38.loopexit ]
  %193 = add nuw nsw i32 %17, 1
  %exitcond = icmp eq i32 %17, 500
  br i1 %exitcond, label %.loopexit39.loopexit, label %.loopexit38..preheader1_crit_edge

.loopexit38..preheader1_crit_edge:                ; preds = %.loopexit38
  br label %.preheader1

.loopexit39.loopexit:                             ; preds = %.loopexit38
  br label %.loopexit39

.loopexit39:                                      ; preds = %..loopexit39_crit_edge, %.loopexit39.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.us.preheader, label %..loopexit2_crit_edge

..loopexit2_crit_edge:                            ; preds = %2
  br label %.loopexit2

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.us.preheader
  %7 = phi i32 [ %23, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %8 = mul nsw i32 %7, 1000
  %9 = sext i32 %7 to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge5, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge5 ], [ 0, %.preheader.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

._crit_edge:                                      ; preds = %11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %._crit_edge, %16
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %9, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond4, label %.loopexit.us, label %._crit_edge5

._crit_edge5:                                     ; preds = %18
  br label %11

.loopexit.us:                                     ; preds = %18
  %23 = add nsw i32 %7, 1
  %24 = icmp slt i32 %23, 1000
  br i1 %24, label %.loopexit.us..preheader.us_crit_edge, label %.loopexit2.loopexit

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit2.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %..loopexit2_crit_edge, %.loopexit2.loopexit
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
