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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
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
  %2 = add nuw nsw i64 %indvars.iv7, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub nuw nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %3, %9
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge, label %.preheader.us

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

.preheader7:                                      ; preds = %._crit_edge46, %.preheader7.lr.ph
  %16 = phi i32 [ 1, %.preheader7.lr.ph ], [ %166, %._crit_edge46 ]
  %17 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %83, %._crit_edge46 ]
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge27.us, %.preheader7
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge27.us ], [ 1, %.preheader7 ]
  %18 = phi [1000 x double]* [ %83, %._crit_edge27.us ], [ %17, %.preheader7 ]
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
  br label %46

._crit_edge27.us:                                 ; preds = %.lr.ph26.us
  %exitcond96 = icmp eq i64 %indvars.iv.next77, 999
  br i1 %exitcond96, label %.lr.ph38.us.preheader, label %.lr.ph29.split.us

.lr.ph26.us:                                      ; preds = %.lr.ph26.us, %._crit_edge.us
  %indvars.iv74 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next75.1, %.lr.ph26.us ]
  %30 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %43, %.lr.ph26.us ]
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv76, i64 %indvars.iv74
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %30
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %indvars.iv74
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv74, i64 %indvars.iv76
  store double %36, double* %37, align 8
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, -1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv76, i64 %indvars.iv.next75
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %36
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %indvars.iv.next75
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv.next75, i64 %indvars.iv76
  store double %43, double* %44, align 8
  %45 = icmp sgt i64 %indvars.iv.next75, 1
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, -2
  br i1 %45, label %.lr.ph26.us, label %._crit_edge27.us

; <label>:46:                                     ; preds = %46, %.lr.ph29.split.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %46 ], [ 1, %.lr.ph29.split.us ]
  %47 = phi double [ %87, %46 ], [ %.pre62, %.lr.ph29.split.us ]
  %48 = phi double [ %77, %46 ], [ %.pre, %.lr.ph29.split.us ]
  %49 = phi [1000 x double]* [ %83, %46 ], [ %18, %.lr.ph29.split.us ]
  %50 = load double, double* %12, align 8
  %51 = fsub double -0.000000e+00, %50
  %52 = add nsw i64 %indvars.iv72, -1
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %49, i64 %indvars.iv76, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fmul double %48, %54
  %56 = fadd double %55, %47
  %57 = fdiv double %51, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %49, i64 %indvars.iv76, i64 %indvars.iv72
  store double %57, double* %58, align 8
  %59 = load double, double* %13, align 8
  %60 = load [1000 x double]*, [1000 x double]** %6, align 8
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv72, i64 %29
  %62 = bitcast double* %61 to <2 x double>*
  %63 = fmul double %59, 2.000000e+00
  %64 = fadd double %63, 1.000000e+00
  %65 = load <2 x double>, <2 x double>* %62, align 8
  %66 = insertelement <2 x double> undef, double %59, i32 0
  %67 = insertelement <2 x double> %66, double %64, i32 1
  %68 = fmul <2 x double> %67, %65
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  %71 = fsub double %70, %69
  %72 = load double, double* %15, align 8
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv72, i64 %indvars.iv.next77
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fsub double %71, %75
  %77 = load double, double* %10, align 8
  %78 = load [1000 x double]*, [1000 x double]** %9, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %52
  %80 = load double, double* %79, align 8
  %81 = fmul double %77, %80
  %82 = fsub double %76, %81
  %83 = load [1000 x double]*, [1000 x double]** %8, align 8
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv76, i64 %52
  %85 = load double, double* %84, align 8
  %86 = fmul double %77, %85
  %87 = load double, double* %11, align 8
  %88 = fadd double %86, %87
  %89 = fdiv double %82, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv76, i64 %indvars.iv72
  store double %89, double* %90, align 8
  %exitcond = icmp eq i64 %indvars.iv72, 998
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %46
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv76
  store double 1.000000e+00, double* %91, align 8
  br label %.lr.ph26.us

.lr.ph38.us.preheader:                            ; preds = %._crit_edge27.us
  %.pre98 = load double, double* %14, align 8
  %.pre99 = load [1000 x double]*, [1000 x double]** %7, align 8
  %.pre100 = load double, double* %12, align 8
  %92 = fsub double -0.000000e+00, %72
  %93 = fmul double %77, 2.000000e+00
  %94 = fadd double %93, 1.000000e+00
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge43.us, %.lr.ph38.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph38.us.preheader ], [ %indvar.next, %._crit_edge43.us ]
  %indvars.iv84 = phi i64 [ 1, %.lr.ph38.us.preheader ], [ %indvars.iv.next85, %._crit_edge43.us ]
  %95 = add i64 %indvar, 1
  %96 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %83, i64 %96, i64 0
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %83, i64 %96, i64 999
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %78, i64 %96, i64 0
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %78, i64 %96, i64 999
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 0
  store double 1.000000e+00, double* %97, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 0
  store double 0.000000e+00, double* %98, align 8
  %99 = bitcast double* %97 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84
  %102 = bitcast [1000 x double]* %101 to i64*
  store i64 %100, i64* %102, align 8
  %103 = add nsw i64 %indvars.iv84, -1
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %bound0 = icmp ult double* %scevgep, %scevgep111
  %bound1 = icmp ult double* %scevgep109, %scevgep107
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv78.lver.orig = phi i64 [ %indvars.iv.next79.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %104 = add nsw i64 %indvars.iv78.lver.orig, -1
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fmul double %59, %106
  %108 = fadd double %107, %.pre98
  %109 = fdiv double %92, %108
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %109, double* %110, align 8
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %103, i64 %indvars.iv78.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %77, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  %115 = load double, double* %114, align 8
  %116 = fmul double %94, %115
  %117 = fsub double %116, %113
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv.next85, i64 %indvars.iv78.lver.orig
  %119 = load double, double* %118, align 8
  %120 = fmul double %.pre100, %119
  %121 = fsub double %117, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %104
  %123 = load double, double* %122, align 8
  %124 = fmul double %59, %123
  %125 = fsub double %121, %124
  %126 = fdiv double %125, %108
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv78.lver.orig
  store double %126, double* %127, align 8
  %exitcond81.lver.orig = icmp eq i64 %indvars.iv78.lver.orig, 998
  %indvars.iv.next79.lver.orig = add nuw nsw i64 %indvars.iv78.lver.orig, 1
  br i1 %exitcond81.lver.orig, label %._crit_edge39.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep114 = getelementptr [1000 x double], [1000 x double]* %78, i64 %95, i64 0
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %83, i64 %95, i64 0
  %load_initial = load double, double* %scevgep113, align 8
  %load_initial115 = load double, double* %scevgep114, align 8
  br label %144

._crit_edge43.us:                                 ; preds = %.lr.ph42.us
  %exitcond97 = icmp eq i64 %indvars.iv.next85, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond97, label %._crit_edge46, label %.lver.check

.lr.ph42.us:                                      ; preds = %.lr.ph42.us, %._crit_edge39.us
  %indvars.iv82 = phi i64 [ 998, %._crit_edge39.us ], [ %indvars.iv.next83.1, %.lr.ph42.us ]
  %128 = phi double [ 1.000000e+00, %._crit_edge39.us ], [ %141, %.lr.ph42.us ]
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv82
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %128
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv82
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 %indvars.iv82
  store double %134, double* %135, align 8
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, -1
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv.next83
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, %134
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv.next83
  %140 = load double, double* %139, align 8
  %141 = fadd double %138, %140
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 %indvars.iv.next83
  store double %141, double* %142, align 8
  %143 = icmp sgt i64 %indvars.iv.next83, 1
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, -2
  br i1 %143, label %.lr.ph42.us, label %._crit_edge43.us

; <label>:144:                                    ; preds = %144, %.ph
  %store_forwarded116 = phi double [ %load_initial115, %.ph ], [ %162, %144 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %147, %144 ]
  %indvars.iv78 = phi i64 [ 1, %.ph ], [ %indvars.iv.next79, %144 ]
  %145 = fmul double %59, %store_forwarded
  %146 = fadd double %145, %.pre98
  %147 = fdiv double %92, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv84, i64 %indvars.iv78
  store double %147, double* %148, align 8
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %103, i64 %indvars.iv78
  %150 = load double, double* %149, align 8
  %151 = fmul double %77, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv84, i64 %indvars.iv78
  %153 = load double, double* %152, align 8
  %154 = fmul double %94, %153
  %155 = fsub double %154, %151
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre99, i64 %indvars.iv.next85, i64 %indvars.iv78
  %157 = load double, double* %156, align 8
  %158 = fmul double %.pre100, %157
  %159 = fsub double %155, %158
  %160 = fmul double %59, %store_forwarded116
  %161 = fsub double %159, %160
  %162 = fdiv double %161, %146
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 %indvars.iv84, i64 %indvars.iv78
  store double %162, double* %163, align 8
  %exitcond81 = icmp eq i64 %indvars.iv78, 998
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  br i1 %exitcond81, label %._crit_edge39.us.loopexit117, label %144

._crit_edge39.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge39.us

._crit_edge39.us.loopexit117:                     ; preds = %144
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit117, %._crit_edge39.us.loopexit
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %60, i64 %indvars.iv84, i64 999
  store double 1.000000e+00, double* %164, align 8
  br label %.lr.ph42.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  %165 = icmp slt i32 %16, 500
  %166 = add nuw nsw i32 %16, 1
  br i1 %165, label %.preheader7, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge46
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv8 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next9, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv8, 1000
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge6 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge6

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge, label %.preheader.us

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
