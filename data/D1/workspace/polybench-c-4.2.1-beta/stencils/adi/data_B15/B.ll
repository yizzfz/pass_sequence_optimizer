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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %2
  %4 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %5 = sitofp i32 %0 to double
  %wide.trip.count.1 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  %8 = insertelement <2 x double> undef, double %5, i32 0
  %9 = insertelement <2 x double> %8, double %5, i32 1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge3.us
  %indvars.iv11 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next12, %._crit_edge3.us ]
  br i1 %6, label %.prol.loopexit, label %10

; <label>:10:                                     ; preds = %._crit_edge.us
  %11 = trunc i64 %indvars.iv11 to i32
  %12 = add i32 %11, %0
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv11, i64 0
  store double %14, double* %15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge.us, %10
  %indvars.iv.unr.ph = phi i64 [ 1, %10 ], [ 0, %._crit_edge.us ]
  br i1 %7, label %._crit_edge3.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit
  %16 = trunc i64 %indvars.iv11 to i32
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge.us.new ], [ %indvars.iv.unr.ph, %._crit_edge.us.new.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %0, %17
  %19 = add i32 %18, %16
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = trunc i64 %indvars.iv.next to i32
  %23 = sub i32 %0, %22
  %24 = add i32 %23, %16
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, %9
  %29 = bitcast double* %21 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge3.us.loopexit, label %._crit_edge.us.new

._crit_edge3.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit, %.prol.loopexit
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %30 = icmp slt i64 %indvars.iv.next12, %4
  br i1 %30, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge3.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = sitofp i32 %0 to double
  %9 = insertelement <2 x double> undef, double %7, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %10
  %12 = extractelement <2 x double> %11, i32 0
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = insertelement <2 x double> %13, double 2.000000e+00, i32 1
  %15 = fmul <2 x double> %11, %14
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = shufflevector <2 x double> %15, <2 x double> %11, <2 x i32> <i32 1, i32 3>
  %18 = fdiv <2 x double> %17, %16
  %19 = fmul <2 x double> %18, <double -5.000000e-01, double -5.000000e-01>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %22 = fadd <2 x double> %18, <double 1.000000e+00, double 1.000000e+00>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  %25 = icmp slt i32 %0, 1
  br i1 %25, label %.loopexit, label %._crit_edge.lr.ph

._crit_edge.lr.ph:                                ; preds = %6
  %26 = sext i32 %1 to i64
  %27 = add nsw i32 %1, -1
  %28 = add nsw i64 %26, -2
  %29 = add nsw i64 %26, -1
  %30 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %19
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %34 = fmul <2 x double> %33, <double 2.000000e+00, double 2.000000e+00>
  %35 = fadd <2 x double> %34, <double 1.000000e+00, double 1.000000e+00>
  %36 = extractelement <2 x double> %35, i32 1
  %37 = add nsw i64 %26, -3
  %sext = shl i64 %29, 32
  %38 = ashr exact i64 %sext, 32
  %39 = zext i32 %27 to i64
  %xtraiter7896 = and i64 %28, 1
  %40 = icmp sgt i64 %29, 2
  %smax = select i1 %40, i64 %29, i64 2
  %41 = icmp sgt i64 %29, 2
  %smax112 = select i1 %41, i64 %29, i64 2
  %42 = icmp sgt i32 %27, 1
  %43 = shufflevector <2 x double> %19, <2 x double> %35, <2 x i32> <i32 1, i32 2>
  %44 = icmp sgt i32 %1, 2
  %45 = icmp eq i64 %xtraiter7896, 0
  %46 = icmp eq i32 %1, 3
  %47 = shufflevector <2 x double> %19, <2 x double> %35, <2 x i32> <i32 1, i32 2>
  %48 = icmp sgt i32 %27, 1
  %49 = icmp sgt i32 %1, 2
  %50 = icmp eq i64 %xtraiter7896, 0
  %51 = icmp eq i32 %1, 3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge40, %._crit_edge.lr.ph
  %52 = phi i32 [ 1, %._crit_edge.lr.ph ], [ %218, %._crit_edge40 ]
  br i1 %42, label %.lver.check.preheader, label %._crit_edge8

.lver.check.preheader:                            ; preds = %._crit_edge
  br label %.lver.check

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge17.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge17.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv64 = phi i64 [ %62, %._crit_edge17.us ], [ 1, %.lver.check.preheader ]
  %53 = add i64 %indvar, 1
  %54 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %54, i64 0
  %scevgep98 = getelementptr [1000 x double], [1000 x double]* %4, i64 %54, i64 %smax
  %scevgep100 = getelementptr [1000 x double], [1000 x double]* %5, i64 %54, i64 0
  %scevgep102 = getelementptr [1000 x double], [1000 x double]* %5, i64 %54, i64 %smax
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv64
  store double 1.000000e+00, double* %55, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 0
  store double 0.000000e+00, double* %56, align 8
  %57 = bitcast double* %55 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64
  %60 = bitcast [1000 x double]* %59 to i64*
  store i64 %58, i64* %60, align 8
  %61 = add nsw i64 %indvars.iv64, -1
  %62 = add nuw nsw i64 %indvars.iv64, 1
  %bound0 = icmp ult double* %scevgep, %scevgep102
  %bound1 = icmp ult double* %scevgep100, %scevgep98
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv60.lver.orig = phi i64 [ %indvars.iv.next61.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %63 = add nsw i64 %indvars.iv60.lver.orig, -1
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fmul double %20, %65
  %67 = fadd double %66, %23
  %68 = fdiv double %31, %67
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv60.lver.orig
  store double %68, double* %69, align 8
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60.lver.orig, i64 %61
  %71 = bitcast double* %70 to <2 x double>*
  %72 = load <2 x double>, <2 x double>* %71, align 8
  %73 = fmul <2 x double> %43, %72
  %74 = extractelement <2 x double> %73, i32 0
  %75 = extractelement <2 x double> %73, i32 1
  %76 = fsub double %75, %74
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60.lver.orig, i64 %62
  %78 = load double, double* %77, align 8
  %79 = fmul double %21, %78
  %80 = fsub double %76, %79
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %63
  %82 = load double, double* %81, align 8
  %83 = fmul double %20, %82
  %84 = fsub double %80, %83
  %85 = fdiv double %84, %67
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv60.lver.orig
  store double %85, double* %86, align 8
  %indvars.iv.next61.lver.orig = add nuw nsw i64 %indvars.iv60.lver.orig, 1
  %87 = icmp slt i64 %indvars.iv.next61.lver.orig, %29
  br i1 %87, label %.ph.lver.orig, label %._crit_edge12.us.loopexit

.ph:                                              ; preds = %.lver.check
  %scevgep105 = getelementptr [1000 x double], [1000 x double]* %5, i64 %53, i64 0
  %scevgep104 = getelementptr [1000 x double], [1000 x double]* %4, i64 %53, i64 0
  %load_initial = load double, double* %scevgep104, align 8
  %load_initial106 = load double, double* %scevgep105, align 8
  br label %107

._crit_edge17.us.loopexit:                        ; preds = %.lr.ph16.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %.prol.loopexit77, %._crit_edge12.us
  %88 = icmp slt i64 %62, %38
  %indvar.next = add i64 %indvar, 1
  br i1 %88, label %.lver.check, label %._crit_edge8.loopexit

.lr.ph16.us.new:                                  ; preds = %.lr.ph16.us.new.preheader, %.lr.ph16.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.lr.ph16.us.new ], [ %indvars.iv62.unr.ph, %.lr.ph16.us.new.preheader ]
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv62
  %90 = load double, double* %89, align 8
  %91 = add nsw i64 %indvars.iv62, 1
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %91, i64 %indvars.iv64
  %93 = load double, double* %92, align 8
  %94 = fmul double %90, %93
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv62
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv64
  store double %97, double* %98, align 8
  %indvars.iv.next63 = add nsw i64 %indvars.iv62, -1
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next63
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %97
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv.next63
  %103 = load double, double* %102, align 8
  %104 = fadd double %101, %103
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next63, i64 %indvars.iv64
  store double %104, double* %105, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, -2
  %106 = icmp sgt i64 %indvars.iv.next63, 1
  br i1 %106, label %.lr.ph16.us.new, label %._crit_edge17.us.loopexit

; <label>:107:                                    ; preds = %.ph, %107
  %store_forwarded107 = phi double [ %load_initial106, %.ph ], [ %125, %107 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %110, %107 ]
  %indvars.iv60 = phi i64 [ 1, %.ph ], [ %indvars.iv.next61, %107 ]
  %108 = fmul double %20, %store_forwarded
  %109 = fadd double %108, %23
  %110 = fdiv double %31, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv60
  store double %110, double* %111, align 8
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60, i64 %61
  %113 = bitcast double* %112 to <2 x double>*
  %114 = load <2 x double>, <2 x double>* %113, align 8
  %115 = fmul <2 x double> %47, %114
  %116 = extractelement <2 x double> %115, i32 0
  %117 = extractelement <2 x double> %115, i32 1
  %118 = fsub double %117, %116
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60, i64 %62
  %120 = load double, double* %119, align 8
  %121 = fmul double %21, %120
  %122 = fsub double %118, %121
  %123 = fmul double %20, %store_forwarded107
  %124 = fsub double %122, %123
  %125 = fdiv double %124, %109
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv60
  store double %125, double* %126, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %127 = icmp slt i64 %indvars.iv.next61, %29
  br i1 %127, label %107, label %._crit_edge12.us.loopexit132

._crit_edge12.us.loopexit:                        ; preds = %.ph.lver.orig
  br label %._crit_edge12.us

._crit_edge12.us.loopexit132:                     ; preds = %107
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit132, %._crit_edge12.us.loopexit
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %29, i64 %indvars.iv64
  store double 1.000000e+00, double* %128, align 8
  br i1 %44, label %.lr.ph16.us, label %._crit_edge17.us

.lr.ph16.us:                                      ; preds = %._crit_edge12.us
  br i1 %45, label %.prol.loopexit77, label %129

; <label>:129:                                    ; preds = %.lr.ph16.us
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %28
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %28
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %28, i64 %indvars.iv64
  store double %134, double* %135, align 8
  br label %.prol.loopexit77

.prol.loopexit77:                                 ; preds = %.lr.ph16.us, %129
  %indvars.iv62.unr.ph = phi i64 [ %37, %129 ], [ %28, %.lr.ph16.us ]
  br i1 %46, label %._crit_edge17.us, label %.lr.ph16.us.new.preheader

.lr.ph16.us.new.preheader:                        ; preds = %.prol.loopexit77
  br label %.lr.ph16.us.new

._crit_edge8.loopexit:                            ; preds = %._crit_edge17.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge
  br i1 %48, label %.lver.check123.preheader, label %._crit_edge40

.lver.check123.preheader:                         ; preds = %._crit_edge8
  br label %.lver.check123

.lver.check123:                                   ; preds = %.lver.check123.preheader, %._crit_edge35.us
  %indvar108 = phi i64 [ %indvar.next109, %._crit_edge35.us ], [ 0, %.lver.check123.preheader ]
  %indvars.iv74 = phi i64 [ %145, %._crit_edge35.us ], [ 1, %.lver.check123.preheader ]
  %136 = add i64 %indvar108, 1
  %137 = add i64 %indvar108, 1
  %scevgep110 = getelementptr [1000 x double], [1000 x double]* %4, i64 %137, i64 0
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %4, i64 %137, i64 %smax112
  %scevgep115 = getelementptr [1000 x double], [1000 x double]* %5, i64 %137, i64 0
  %scevgep117 = getelementptr [1000 x double], [1000 x double]* %5, i64 %137, i64 %smax112
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 0
  store double 1.000000e+00, double* %138, align 8
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 0
  store double 0.000000e+00, double* %139, align 8
  %140 = bitcast double* %138 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74
  %143 = bitcast [1000 x double]* %142 to i64*
  store i64 %141, i64* %143, align 8
  %144 = add nsw i64 %indvars.iv74, -1
  %145 = add nuw nsw i64 %indvars.iv74, 1
  %bound0119 = icmp ult double* %scevgep110, %scevgep117
  %bound1120 = icmp ult double* %scevgep115, %scevgep113
  %memcheck.conflict122 = and i1 %bound0119, %bound1120
  br i1 %memcheck.conflict122, label %.ph124.lver.orig.preheader, label %.ph124

.ph124.lver.orig.preheader:                       ; preds = %.lver.check123
  br label %.ph124.lver.orig

.ph124.lver.orig:                                 ; preds = %.ph124.lver.orig.preheader, %.ph124.lver.orig
  %indvars.iv70.lver.orig = phi i64 [ %indvars.iv.next71.lver.orig, %.ph124.lver.orig ], [ 1, %.ph124.lver.orig.preheader ]
  %146 = add nsw i64 %indvars.iv70.lver.orig, -1
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %146
  %148 = load double, double* %147, align 8
  %149 = fmul double %21, %148
  %150 = fadd double %149, %24
  %151 = fdiv double %32, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv70.lver.orig
  store double %151, double* %152, align 8
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %144, i64 %indvars.iv70.lver.orig
  %154 = load double, double* %153, align 8
  %155 = fmul double %20, %154
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv70.lver.orig
  %157 = load double, double* %156, align 8
  %158 = fmul double %36, %157
  %159 = fsub double %158, %155
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %145, i64 %indvars.iv70.lver.orig
  %161 = load double, double* %160, align 8
  %162 = fmul double %20, %161
  %163 = fsub double %159, %162
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %146
  %165 = load double, double* %164, align 8
  %166 = fmul double %21, %165
  %167 = fsub double %163, %166
  %168 = fdiv double %167, %150
  %169 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv70.lver.orig
  store double %168, double* %169, align 8
  %indvars.iv.next71.lver.orig = add nuw nsw i64 %indvars.iv70.lver.orig, 1
  %170 = icmp slt i64 %indvars.iv.next71.lver.orig, %29
  br i1 %170, label %.ph124.lver.orig, label %._crit_edge29.us.loopexit

.ph124:                                           ; preds = %.lver.check123
  %scevgep128 = getelementptr [1000 x double], [1000 x double]* %5, i64 %136, i64 0
  %scevgep125 = getelementptr [1000 x double], [1000 x double]* %4, i64 %136, i64 0
  %load_initial126 = load double, double* %scevgep125, align 8
  %load_initial129 = load double, double* %scevgep128, align 8
  br label %189

._crit_edge35.us.loopexit:                        ; preds = %.lr.ph34.us.new
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us.loopexit, %.prol.loopexit85, %._crit_edge29.us
  %exitcond92 = icmp eq i64 %145, %39
  %indvar.next109 = add i64 %indvar108, 1
  br i1 %exitcond92, label %._crit_edge40.loopexit, label %.lver.check123

.lr.ph34.us.new:                                  ; preds = %.lr.ph34.us.new.preheader, %.lr.ph34.us.new
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.1, %.lr.ph34.us.new ], [ %indvars.iv72.unr.ph, %.lr.ph34.us.new.preheader ]
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv72
  %172 = load double, double* %171, align 8
  %173 = add nsw i64 %indvars.iv72, 1
  %174 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %173
  %175 = load double, double* %174, align 8
  %176 = fmul double %172, %175
  %177 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv72
  %178 = load double, double* %177, align 8
  %179 = fadd double %176, %178
  %180 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %indvars.iv72
  store double %179, double* %180, align 8
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, -1
  %181 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv.next73
  %182 = load double, double* %181, align 8
  %183 = fmul double %182, %179
  %184 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv.next73
  %185 = load double, double* %184, align 8
  %186 = fadd double %183, %185
  %187 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %indvars.iv.next73
  store double %186, double* %187, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, -2
  %188 = icmp sgt i64 %indvars.iv.next73, 1
  br i1 %188, label %.lr.ph34.us.new, label %._crit_edge35.us.loopexit

; <label>:189:                                    ; preds = %.ph124, %189
  %store_forwarded130 = phi double [ %load_initial129, %.ph124 ], [ %207, %189 ]
  %store_forwarded127 = phi double [ %load_initial126, %.ph124 ], [ %192, %189 ]
  %indvars.iv70 = phi i64 [ 1, %.ph124 ], [ %indvars.iv.next71, %189 ]
  %190 = fmul double %21, %store_forwarded127
  %191 = fadd double %190, %24
  %192 = fdiv double %32, %191
  %193 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv70
  store double %192, double* %193, align 8
  %194 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %144, i64 %indvars.iv70
  %195 = load double, double* %194, align 8
  %196 = fmul double %20, %195
  %197 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv70
  %198 = load double, double* %197, align 8
  %199 = fmul double %36, %198
  %200 = fsub double %199, %196
  %201 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %145, i64 %indvars.iv70
  %202 = load double, double* %201, align 8
  %203 = fmul double %20, %202
  %204 = fsub double %200, %203
  %205 = fmul double %21, %store_forwarded130
  %206 = fsub double %204, %205
  %207 = fdiv double %206, %191
  %208 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv70
  store double %207, double* %208, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %209 = icmp slt i64 %indvars.iv.next71, %29
  br i1 %209, label %189, label %._crit_edge29.us.loopexit131

._crit_edge29.us.loopexit:                        ; preds = %.ph124.lver.orig
  br label %._crit_edge29.us

._crit_edge29.us.loopexit131:                     ; preds = %189
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit131, %._crit_edge29.us.loopexit
  %210 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %29
  store double 1.000000e+00, double* %210, align 8
  br i1 %49, label %.lr.ph34.us, label %._crit_edge35.us

.lr.ph34.us:                                      ; preds = %._crit_edge29.us
  br i1 %50, label %.prol.loopexit85, label %211

; <label>:211:                                    ; preds = %.lr.ph34.us
  %212 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %28
  %213 = load double, double* %212, align 8
  %214 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %28
  %215 = load double, double* %214, align 8
  %216 = fadd double %213, %215
  %217 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %28
  store double %216, double* %217, align 8
  br label %.prol.loopexit85

.prol.loopexit85:                                 ; preds = %.lr.ph34.us, %211
  %indvars.iv72.unr.ph = phi i64 [ %37, %211 ], [ %28, %.lr.ph34.us ]
  br i1 %51, label %._crit_edge35.us, label %.lr.ph34.us.new.preheader

.lr.ph34.us.new.preheader:                        ; preds = %.prol.loopexit85
  br label %.lr.ph34.us.new

._crit_edge40.loopexit:                           ; preds = %._crit_edge35.us
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %._crit_edge8
  %218 = add nsw i32 %52, 1
  %219 = icmp slt i32 %52, %0
  br i1 %219, label %._crit_edge, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge40
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %10

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %21 = icmp slt i64 %indvars.iv.next14, %8
  br i1 %21, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge4.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
