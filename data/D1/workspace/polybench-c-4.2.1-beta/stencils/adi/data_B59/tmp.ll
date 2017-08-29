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
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next8, %._crit_edge.us..preheader.us_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv7, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %8, double* %9, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge11:                                    ; preds = %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
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

.preheader7:                                      ; preds = %._crit_edge46..preheader7_crit_edge, %.preheader7.lr.ph
  %16 = phi i32 [ 1, %.preheader7.lr.ph ], [ %155, %._crit_edge46..preheader7_crit_edge ]
  %17 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %82, %._crit_edge46..preheader7_crit_edge ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us..lr.ph29.split.us_crit_edge, %.preheader7
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ 1, %.preheader7 ]
  %18 = phi [1000 x double]* [ %82, %._crit_edge27.us..lr.ph29.split.us_crit_edge ], [ %17, %.preheader7 ]
  %19 = load [1000 x double]*, [1000 x double]** %7, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv76
  store double 1.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv76, i64 0
  store double 0.000000e+00, double* %21, align 8
  %22 = load [1000 x double]*, [1000 x double]** %7, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 0, i64 %indvars.iv76
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = load [1000 x double]*, [1000 x double]** %9, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv76
  %28 = bitcast [1000 x double]* %27 to i64*
  store i64 %25, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv76, -1
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %.pre = load double, double* %10, align 8
  %.pre62 = load double, double* %11, align 8
  br label %45

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond103 = icmp eq i64 %indvars.iv.next77, 999
  br i1 %exitcond103, label %.lver.check.preheader, label %._crit_edge27.us..lr.ph29.split.us_crit_edge

._crit_edge27.us..lr.ph29.split.us_crit_edge:     ; preds = %._crit_edge27.us
  br label %.lr.ph29.split.us

.lver.check.preheader:                            ; preds = %._crit_edge27.us
  %30 = fsub double -0.000000e+00, %71
  %31 = load double, double* %14, align 8
  %32 = load [1000 x double]*, [1000 x double]** %7, align 8
  %33 = fmul double %76, 2.000000e+00
  %34 = fadd double %33, 1.000000e+00
  %35 = load double, double* %12, align 8
  br label %.lver.check

.lr.ph26.us:                                      ; preds = %.lr.ph26.us..lr.ph26.us_crit_edge, %._crit_edge.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %.lr.ph26.us..lr.ph26.us_crit_edge ], [ 998, %._crit_edge.us ]
  %36 = phi double [ %42, %.lr.ph26.us..lr.ph26.us_crit_edge ], [ 1.000000e+00, %._crit_edge.us ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv76, i64 %indvars.iv74
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %36
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv76, i64 %indvars.iv74
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv74, i64 %indvars.iv76
  store double %42, double* %43, align 8
  %44 = icmp sgt i64 %indvars.iv74, 1
  br i1 %44, label %.lr.ph26.us..lr.ph26.us_crit_edge, label %._crit_edge27.us

.lr.ph26.us..lr.ph26.us_crit_edge:                ; preds = %.lr.ph26.us
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, -1
  br label %.lr.ph26.us

; <label>:45:                                     ; preds = %._crit_edge127, %.lr.ph29.split.us
  %indvars.iv72 = phi i64 [ 1, %.lr.ph29.split.us ], [ %indvars.iv.next73, %._crit_edge127 ]
  %46 = phi double [ %.pre62, %.lr.ph29.split.us ], [ %86, %._crit_edge127 ]
  %47 = phi double [ %.pre, %.lr.ph29.split.us ], [ %76, %._crit_edge127 ]
  %48 = phi [1000 x double]* [ %18, %.lr.ph29.split.us ], [ %82, %._crit_edge127 ]
  %49 = load double, double* %12, align 8
  %50 = fsub double -0.000000e+00, %49
  %51 = add nsw i64 %indvars.iv72, -1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv76, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fmul double %47, %53
  %55 = fadd double %54, %46
  %56 = fdiv double %50, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv76, i64 %indvars.iv72
  store double %56, double* %57, align 8
  %58 = load double, double* %13, align 8
  %59 = load [1000 x double]*, [1000 x double]** %6, align 8
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv72, i64 %29
  %61 = bitcast double* %60 to <2 x double>*
  %62 = fmul double %58, 2.000000e+00
  %63 = fadd double %62, 1.000000e+00
  %64 = load <2 x double>, <2 x double>* %61, align 8
  %65 = insertelement <2 x double> undef, double %58, i32 0
  %66 = insertelement <2 x double> %65, double %63, i32 1
  %67 = fmul <2 x double> %66, %64
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fsub double %69, %68
  %71 = load double, double* %15, align 8
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv72, i64 %indvars.iv.next77
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %70, %74
  %76 = load double, double* %10, align 8
  %77 = load [1000 x double]*, [1000 x double]** %9, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv76, i64 %51
  %79 = load double, double* %78, align 8
  %80 = fmul double %76, %79
  %81 = fsub double %75, %80
  %82 = load [1000 x double]*, [1000 x double]** %8, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv76, i64 %51
  %84 = load double, double* %83, align 8
  %85 = fmul double %76, %84
  %86 = load double, double* %11, align 8
  %87 = fadd double %85, %86
  %88 = fdiv double %81, %87
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv76, i64 %indvars.iv72
  store double %88, double* %89, align 8
  %exitcond = icmp eq i64 %indvars.iv72, 998
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge127

._crit_edge127:                                   ; preds = %45
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br label %45

._crit_edge.us:                                   ; preds = %45
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv76
  store double 1.000000e+00, double* %90, align 8
  br label %.lr.ph26.us

.lver.check:                                      ; preds = %._crit_edge43.us..lver.check_crit_edge, %.lver.check.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge43.us..lver.check_crit_edge ], [ 0, %.lver.check.preheader ]
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge43.us..lver.check_crit_edge ], [ 1, %.lver.check.preheader ]
  %91 = add i64 %indvar, 1
  %92 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %82, i64 %92, i64 0
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %82, i64 %92, i64 999
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %77, i64 %92, i64 0
  %scevgep115 = getelementptr [1000 x double], [1000 x double]* %77, i64 %92, i64 999
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv84, i64 0
  store double 1.000000e+00, double* %93, align 8
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv84, i64 0
  store double 0.000000e+00, double* %94, align 8
  %95 = bitcast double* %93 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv84
  %98 = bitcast [1000 x double]* %97 to i64*
  store i64 %96, i64* %98, align 8
  %99 = add nsw i64 %indvars.iv84, -1
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %bound0 = icmp ult double* %scevgep, %scevgep115
  %bound1 = icmp ult double* %scevgep113, %scevgep111
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.ph.lver.orig.preheader
  %indvars.iv78.lver.orig = phi i64 [ %indvars.iv.next79.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.ph.lver.orig.preheader ]
  %100 = add nsw i64 %indvars.iv78.lver.orig, -1
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv84, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fmul double %58, %102
  %104 = fadd double %103, %31
  %105 = fdiv double %30, %104
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %105, double* %106, align 8
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %99, i64 %indvars.iv78.lver.orig
  %108 = load double, double* %107, align 8
  %109 = fmul double %76, %108
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  %111 = load double, double* %110, align 8
  %112 = fmul double %34, %111
  %113 = fsub double %112, %109
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv.next85, i64 %indvars.iv78.lver.orig
  %115 = load double, double* %114, align 8
  %116 = fmul double %35, %115
  %117 = fsub double %113, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv84, i64 %100
  %119 = load double, double* %118, align 8
  %120 = fmul double %58, %119
  %121 = fsub double %117, %120
  %122 = fdiv double %121, %104
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %122, double* %123, align 8
  %exitcond81.lver.orig = icmp eq i64 %indvars.iv78.lver.orig, 998
  br i1 %exitcond81.lver.orig, label %._crit_edge39.us.loopexit, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  %indvars.iv.next79.lver.orig = add nuw nsw i64 %indvars.iv78.lver.orig, 1
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep118 = getelementptr [1000 x double], [1000 x double]* %77, i64 %91, i64 0
  %scevgep117 = getelementptr [1000 x double], [1000 x double]* %82, i64 %91, i64 0
  %load_initial = load double, double* %scevgep117, align 8
  %load_initial119 = load double, double* %scevgep118, align 8
  br label %133

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond104 = icmp eq i64 %indvars.iv.next85, 999
  br i1 %exitcond104, label %._crit_edge46, label %._crit_edge43.us..lver.check_crit_edge

._crit_edge43.us..lver.check_crit_edge:           ; preds = %._crit_edge43.us
  %indvar.next = add i64 %indvar, 1
  br label %.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us..lr.ph42.us_crit_edge, %._crit_edge39.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %.lr.ph42.us..lr.ph42.us_crit_edge ], [ 998, %._crit_edge39.us ]
  %124 = phi double [ %130, %.lr.ph42.us..lr.ph42.us_crit_edge ], [ 1.000000e+00, %._crit_edge39.us ]
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv84, i64 %indvars.iv82
  %126 = load double, double* %125, align 8
  %127 = fmul double %126, %124
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv84, i64 %indvars.iv82
  %129 = load double, double* %128, align 8
  %130 = fadd double %127, %129
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv84, i64 %indvars.iv82
  store double %130, double* %131, align 8
  %132 = icmp sgt i64 %indvars.iv82, 1
  br i1 %132, label %.lr.ph42.us..lr.ph42.us_crit_edge, label %._crit_edge43.us

.lr.ph42.us..lr.ph42.us_crit_edge:                ; preds = %.lr.ph42.us
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, -1
  br label %.lr.ph42.us

; <label>:133:                                    ; preds = %._crit_edge128, %.ph
  %store_forwarded120 = phi double [ %load_initial119, %.ph ], [ %151, %._crit_edge128 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %136, %._crit_edge128 ]
  %indvars.iv78 = phi i64 [ 1, %.ph ], [ %indvars.iv.next79, %._crit_edge128 ]
  %134 = fmul double %58, %store_forwarded
  %135 = fadd double %134, %31
  %136 = fdiv double %30, %135
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv84, i64 %indvars.iv78
  store double %136, double* %137, align 8
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %99, i64 %indvars.iv78
  %139 = load double, double* %138, align 8
  %140 = fmul double %76, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv84, i64 %indvars.iv78
  %142 = load double, double* %141, align 8
  %143 = fmul double %34, %142
  %144 = fsub double %143, %140
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv.next85, i64 %indvars.iv78
  %146 = load double, double* %145, align 8
  %147 = fmul double %35, %146
  %148 = fsub double %144, %147
  %149 = fmul double %58, %store_forwarded120
  %150 = fsub double %148, %149
  %151 = fdiv double %150, %135
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %indvars.iv84, i64 %indvars.iv78
  store double %151, double* %152, align 8
  %exitcond81 = icmp eq i64 %indvars.iv78, 998
  br i1 %exitcond81, label %._crit_edge39.us.loopexit121, label %._crit_edge128

._crit_edge128:                                   ; preds = %133
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  br label %133

._crit_edge39.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit121:                     ; preds = %133
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit121, %._crit_edge39.us.loopexit
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv84, i64 999
  store double 1.000000e+00, double* %153, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %154 = icmp slt i32 %16, 500
  br i1 %154, label %._crit_edge46..preheader7_crit_edge, label %._crit_edge

._crit_edge46..preheader7_crit_edge:              ; preds = %._crit_edge46
  %155 = add nuw nsw i32 %16, 1
  br label %.preheader7

._crit_edge:                                      ; preds = %._crit_edge46
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %..preheader.us_crit_edge
  %indvars.iv8 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next9, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv8, 1000
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10.._crit_edge11_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge10.._crit_edge11_crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11.._crit_edge10_crit_edge

._crit_edge11.._crit_edge10_crit_edge:            ; preds = %._crit_edge11
  br label %._crit_edge10

; <label>:11:                                     ; preds = %._crit_edge11
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge11.._crit_edge10_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge10.._crit_edge11_crit_edge

._crit_edge10.._crit_edge11_crit_edge:            ; preds = %._crit_edge10
  br label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge10
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond12, label %._crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
