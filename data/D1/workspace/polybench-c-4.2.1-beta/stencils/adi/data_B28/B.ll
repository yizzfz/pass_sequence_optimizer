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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
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
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %2 = add nsw i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  %4 = trunc i64 %2 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %8, double* %9, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %11 = sub i32 %4, %10
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %13, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %165, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %.lr.ph8.us.._crit_edge9.us_crit_edge, %.preheader4
  %indvar = phi i64 [ %indvar.next, %.lr.ph8.us.._crit_edge9.us_crit_edge ], [ 0, %.preheader4 ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %.lr.ph8.us.._crit_edge9.us_crit_edge ], [ 1, %.preheader4 ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep55
  %bound1 = icmp ult double* %scevgep53, %scevgep51
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %15
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = fmul <2 x double> %22, <double 0xC09F400000000001, double 0xC08F400000000001>
  %24 = fadd <2 x double> %23, <double 0x40AF420000000001, double 0x409F440000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 0
  %27 = fdiv double 0x409F400000000001, %25
  store double %27, double* %18, align 8
  %28 = bitcast double* %19 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %28, align 8
  %30 = fmul <2 x double> %29, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fadd double %31, %32
  %34 = load double, double* %20, align 8
  %35 = fmul double %34, 0xC08F400000000001
  %36 = fsub double %33, %35
  %37 = load double, double* %21, align 8
  %38 = fmul double %37, 0xC09F400000000001
  %39 = fsub double %36, %38
  %40 = fdiv double %39, %26
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %40, double* %41, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond46.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond46.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep57, align 8
  %load_initial59 = load double, double* %scevgep58, align 8
  br label %60

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.lr.ph8.us ], [ 998, %._crit_edge.us ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %43 = load double, double* %42, align 8
  %44 = or i64 %indvars.iv25, 1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %44, i64 %indvars.iv27
  %46 = load double, double* %45, align 8
  %47 = fmul double %43, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %50, double* %51, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %50
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %57, double* %58, align 8
  %59 = icmp sgt i64 %indvars.iv.next26, 1
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  br i1 %59, label %.lr.ph8.us, label %.lr.ph8.us.._crit_edge9.us_crit_edge

.lr.ph8.us.._crit_edge9.us_crit_edge:             ; preds = %.lr.ph8.us
  %exitcond = icmp eq i64 %indvars.iv.next28, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.lver.check75.preheader, label %.lver.check

.lver.check75.preheader:                          ; preds = %.lr.ph8.us.._crit_edge9.us_crit_edge
  br label %.lver.check75

; <label>:60:                                     ; preds = %60, %.ph
  %store_forwarded60 = phi double [ %load_initial59, %.ph ], [ %81, %60 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %69, %60 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %60 ]
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %64 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %65 = fmul <2 x double> %64, <double 0xC09F400000000001, double 0xC08F400000000001>
  %66 = fadd <2 x double> %65, <double 0x40AF420000000001, double 0x409F440000000001>
  %67 = extractelement <2 x double> %66, i32 0
  %68 = extractelement <2 x double> %66, i32 0
  %69 = fdiv double 0x409F400000000001, %67
  store double %69, double* %61, align 8
  %70 = bitcast double* %62 to <2 x double>*
  %71 = load <2 x double>, <2 x double>* %70, align 8
  %72 = fmul <2 x double> %71, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %73 = extractelement <2 x double> %72, i32 0
  %74 = extractelement <2 x double> %72, i32 1
  %75 = fadd double %73, %74
  %76 = load double, double* %63, align 8
  %77 = fmul double %76, 0xC08F400000000001
  %78 = fsub double %75, %77
  %79 = fmul double %store_forwarded60, 0xC09F400000000001
  %80 = fsub double %78, %79
  %81 = fdiv double %80, %68
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %81, double* %82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond46, label %._crit_edge.us.loopexit84, label %60

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit84:                        ; preds = %60
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit84, %._crit_edge.us.loopexit
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %83, align 8
  br label %.lr.ph8.us

.lver.check75:                                    ; preds = %.lver.check75.preheader, %.lr.ph18.us.._crit_edge19.us_crit_edge
  %indvar61 = phi i64 [ %indvar.next62, %.lr.ph18.us.._crit_edge19.us_crit_edge ], [ 0, %.lver.check75.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %.lr.ph18.us.._crit_edge19.us_crit_edge ], [ 1, %.lver.check75.preheader ]
  %84 = add i64 %indvar61, 1
  %85 = add i64 %indvar61, 1
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %85, i64 0
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %4, i64 %85, i64 999
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %85, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %5, i64 %85, i64 999
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %86, i64 0, i64 0
  store double 1.000000e+00, double* %87, align 8
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %88, align 8
  %89 = bitcast [1000 x double]* %86 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %92 = bitcast [1000 x double]* %91 to i64*
  store i64 %90, i64* %92, align 8
  %93 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound071 = icmp ult double* %scevgep63, %scevgep69
  %bound172 = icmp ult double* %scevgep67, %scevgep65
  %memcheck.conflict74 = and i1 %bound071, %bound172
  br i1 %memcheck.conflict74, label %.ph76.lver.orig.preheader, label %.ph76

.ph76.lver.orig.preheader:                        ; preds = %.lver.check75
  br label %.ph76.lver.orig

.ph76.lver.orig:                                  ; preds = %.ph76.lver.orig.preheader, %.ph76.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph76.lver.orig ], [ 1, %.ph76.lver.orig.preheader ]
  %94 = add nsw i64 %indvars.iv31.lver.orig, -1
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %94
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %93, i64 %indvars.iv31.lver.orig
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31.lver.orig
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %94
  %102 = insertelement <2 x double> undef, double %96, i32 0
  %103 = shufflevector <2 x double> %102, <2 x double> undef, <2 x i32> zeroinitializer
  %104 = fmul <2 x double> %103, <double 0xC08F400000000001, double 0xC08F400000000001>
  %105 = fadd <2 x double> %104, <double 0x409F440000000001, double 0x409F440000000001>
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fdiv double 0x408F400000000001, %106
  store double %108, double* %97, align 8
  %109 = load double, double* %98, align 8
  %110 = fmul double %109, 0x409F400000000001
  %111 = load double, double* %99, align 8
  %112 = fmul double %111, 0xC0AF3E0000000001
  %113 = fadd double %110, %112
  %114 = load double, double* %100, align 8
  %115 = fmul double %114, 0xC09F400000000001
  %116 = fsub double %113, %115
  %117 = load double, double* %101, align 8
  %118 = fmul double %117, 0xC08F400000000001
  %119 = fsub double %116, %118
  %120 = fdiv double %119, %107
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %120, double* %121, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond47.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, 999
  br i1 %exitcond47.lver.orig, label %._crit_edge15.us.loopexit, label %.ph76.lver.orig

.ph76:                                            ; preds = %.lver.check75
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %5, i64 %84, i64 0
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %4, i64 %84, i64 0
  %load_initial78 = load double, double* %scevgep77, align 8
  %load_initial81 = load double, double* %scevgep80, align 8
  br label %140

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph18.us ], [ 998, %._crit_edge15.us ]
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv35
  %123 = load double, double* %122, align 8
  %124 = or i64 %indvars.iv35, 1
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %124
  %126 = load double, double* %125, align 8
  %127 = fmul double %123, %126
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv35
  %129 = load double, double* %128, align 8
  %130 = fadd double %127, %129
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  store double %130, double* %131, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next36
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %130
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next36
  %136 = load double, double* %135, align 8
  %137 = fadd double %134, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next36
  store double %137, double* %138, align 8
  %139 = icmp sgt i64 %indvars.iv.next36, 1
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  br i1 %139, label %.lr.ph18.us, label %.lr.ph18.us.._crit_edge19.us_crit_edge

.lr.ph18.us.._crit_edge19.us_crit_edge:           ; preds = %.lr.ph18.us
  %exitcond48 = icmp eq i64 %indvars.iv.next40, 999
  %indvar.next62 = add i64 %indvar61, 1
  br i1 %exitcond48, label %._crit_edge22, label %.lver.check75

; <label>:140:                                    ; preds = %140, %.ph76
  %store_forwarded82 = phi double [ %load_initial81, %.ph76 ], [ %162, %140 ]
  %store_forwarded79 = phi double [ %load_initial78, %.ph76 ], [ %151, %140 ]
  %indvars.iv31 = phi i64 [ 1, %.ph76 ], [ %indvars.iv.next32, %140 ]
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %93, i64 %indvars.iv31
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31
  %145 = insertelement <2 x double> undef, double %store_forwarded79, i32 0
  %146 = shufflevector <2 x double> %145, <2 x double> undef, <2 x i32> zeroinitializer
  %147 = fmul <2 x double> %146, <double 0xC08F400000000001, double 0xC08F400000000001>
  %148 = fadd <2 x double> %147, <double 0x409F440000000001, double 0x409F440000000001>
  %149 = extractelement <2 x double> %148, i32 0
  %150 = extractelement <2 x double> %148, i32 1
  %151 = fdiv double 0x408F400000000001, %149
  store double %151, double* %141, align 8
  %152 = load double, double* %142, align 8
  %153 = fmul double %152, 0x409F400000000001
  %154 = load double, double* %143, align 8
  %155 = fmul double %154, 0xC0AF3E0000000001
  %156 = fadd double %153, %155
  %157 = load double, double* %144, align 8
  %158 = fmul double %157, 0xC09F400000000001
  %159 = fsub double %156, %158
  %160 = fmul double %store_forwarded82, 0xC08F400000000001
  %161 = fsub double %159, %160
  %162 = fdiv double %161, %150
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31
  store double %162, double* %163, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond47, label %._crit_edge15.us.loopexit83, label %140

._crit_edge15.us.loopexit:                        ; preds = %.ph76.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit83:                      ; preds = %140
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit83, %._crit_edge15.us.loopexit
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 999
  store double 1.000000e+00, double* %164, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %.lr.ph18.us.._crit_edge19.us_crit_edge
  %exitcond43 = icmp eq i32 %.0323, 500
  %165 = add nuw nsw i32 %.0323, 1
  br i1 %exitcond43, label %._crit_edge24, label %.preheader4

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond9, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
