; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %3 = add nuw nsw i64 %indvars.iv26, 1000
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv5.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 false, label %.preheader._crit_edge, label %.preheader.preheader11

.preheader.preheader11:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader11, %.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv5.unr.ph, %.preheader.preheader11 ]
  %4 = sub i64 %3, %indvars.iv5
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %8 = sub i64 %3, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br i1 false, label %._crit_edge41, label %.preheader4.preheader.lr.ph

.preheader4.preheader.lr.ph:                      ; preds = %6
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader._crit_edge, %.preheader4.preheader.lr.ph
  %.0340 = phi i32 [ 1, %.preheader4.preheader.lr.ph ], [ %167, %.preheader._crit_edge ]
  br i1 true, label %.lr.ph26, label %.preheader.preheader

.lr.ph26:                                         ; preds = %.preheader4.preheader
  br i1 false, label %.lr.ph26.split.us.preheader, label %.lver.check.preheader

.lver.check.preheader:                            ; preds = %.lr.ph26
  br label %.lver.check

.lr.ph26.split.us.preheader:                      ; preds = %.lr.ph26
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %.lr.ph26.split.us.preheader, %.preheader4.us
  br i1 undef, label %.lr.ph21.us.preheader, label %.preheader4.us

.lr.ph21.us.preheader:                            ; preds = %.lr.ph26.split.us
  br label %.lr.ph21.us

.preheader4.us.loopexit:                          ; preds = %.lr.ph21.us
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.loopexit, %.lr.ph26.split.us
  br i1 true, label %.preheader.preheader.loopexit, label %.lr.ph26.split.us

.lr.ph21.us:                                      ; preds = %.lr.ph21.us, %.lr.ph21.us.preheader
  br i1 false, label %.lr.ph21.us, label %.preheader4.us.loopexit

.preheader.preheader.loopexit:                    ; preds = %.preheader4.us
  br label %.preheader.preheader

.preheader.preheader.loopexit91:                  ; preds = %.preheader4
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit91, %.preheader.preheader.loopexit, %.preheader4.preheader
  br i1 true, label %.lver.check79.preheader, label %.preheader._crit_edge

.lver.check79.preheader:                          ; preds = %.preheader.preheader
  br label %.lver.check79

.lver.check:                                      ; preds = %.lver.check.preheader, %.preheader4
  %indvar = phi i64 [ %indvar.next, %.preheader4 ], [ 0, %.lver.check.preheader ]
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %.preheader4 ], [ 1, %.lver.check.preheader ]
  %7 = add i64 %indvar, 1
  %8 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv723
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv723, -1
  %16 = add nuw nsw i64 %indvars.iv723, 1
  %bound0 = icmp ult double* %scevgep, %scevgep57
  %bound1 = icmp ult double* %scevgep55, %scevgep53
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %17 = add nsw i64 %indvars.iv18.lver.orig, -1
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723, i64 %17
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723, i64 %indvars.iv18.lver.orig
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.lver.orig, i64 %15
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.lver.orig, i64 %16
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723, i64 %17
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = fmul <2 x double> %24, <double 0xC09F400000000001, double 0xC08F400000000001>
  %26 = fadd <2 x double> %25, <double 0x40AF420000000001, double 0x409F440000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 0
  %29 = fdiv double 0x409F400000000001, %27
  store double %29, double* %20, align 8
  %30 = bitcast double* %21 to <2 x double>*
  %31 = load <2 x double>, <2 x double>* %30, align 8
  %32 = fmul <2 x double> %31, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fsub double %34, %33
  %36 = load double, double* %22, align 8
  %37 = fmul double %36, 0xC08F400000000001
  %38 = fsub double %35, %37
  %39 = load double, double* %23, align 8
  %40 = fmul double %39, 0xC09F400000000001
  %41 = fsub double %38, %40
  %42 = fdiv double %41, %28
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723, i64 %indvars.iv18.lver.orig
  store double %42, double* %43, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %load_initial = load double, double* %scevgep59, align 8
  %load_initial63 = load double, double* %scevgep62, align 8
  br label %44

; <label>:44:                                     ; preds = %.ph, %44
  %store_forwarded64 = phi double [ %load_initial63, %.ph ], [ %65, %44 ]
  %store_forwarded61 = phi double [ %load_initial, %.ph ], [ %53, %44 ]
  %indvars.iv18 = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %44 ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723, i64 %indvars.iv18
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %15
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %16
  %48 = insertelement <2 x double> undef, double %store_forwarded61, i32 0
  %49 = fmul <2 x double> %48, <double 0xC09F400000000001, double 0xC08F400000000001>
  %50 = fadd <2 x double> %49, <double 0x40AF420000000001, double 0x409F440000000001>
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 0
  %53 = fdiv double 0x409F400000000001, %51
  store double %53, double* %45, align 8
  %54 = bitcast double* %46 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %54, align 8
  %56 = fmul <2 x double> %55, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  %59 = fsub double %58, %57
  %60 = load double, double* %47, align 8
  %61 = fmul double %60, 0xC08F400000000001
  %62 = fsub double %59, %61
  %63 = fmul double %store_forwarded64, 0xC09F400000000001
  %64 = fsub double %62, %63
  %65 = fdiv double %64, %52
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723, i64 %indvars.iv18
  store double %65, double* %66, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.loopexit90, label %44

._crit_edge.loopexit:                             ; preds = %.ph.lver.orig
  br label %._crit_edge

._crit_edge.loopexit90:                           ; preds = %44
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit90, %._crit_edge.loopexit
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv723
  store double 1.000000e+00, double* %67, align 8
  br i1 true, label %.lr.ph21.preheader, label %.preheader4

.lr.ph21.preheader:                               ; preds = %._crit_edge
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21, %.lr.ph21.preheader
  %indvars.iv519 = phi i64 [ 998, %.lr.ph21.preheader ], [ %indvars.iv.next6.1, %.lr.ph21 ]
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723, i64 %indvars.iv519
  %69 = load double, double* %68, align 8
  %70 = or i64 %indvars.iv519, 1
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %70, i64 %indvars.iv723
  %72 = load double, double* %71, align 8
  %73 = fmul double %69, %72
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723, i64 %indvars.iv519
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv519, i64 %indvars.iv723
  store double %76, double* %77, align 8
  %indvars.iv.next6 = add nsw i64 %indvars.iv519, -1
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723, i64 %indvars.iv.next6
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %76
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723, i64 %indvars.iv.next6
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next6, i64 %indvars.iv723
  store double %83, double* %84, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv519, -2
  %85 = icmp sgt i64 %indvars.iv.next6, 1
  br i1 %85, label %.lr.ph21, label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %.lr.ph21
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next8, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond44, label %.preheader.preheader.loopexit91, label %.lver.check

.lver.check79:                                    ; preds = %.lver.check79.preheader, %.preheader
  %indvar65 = phi i64 [ %indvar.next66, %.preheader ], [ 0, %.lver.check79.preheader ]
  %indvars.iv1536 = phi i64 [ %indvars.iv.next16, %.preheader ], [ 1, %.lver.check79.preheader ]
  %86 = add i64 %indvar65, 1
  %87 = add i64 %indvar65, 1
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %4, i64 %87, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %4, i64 %87, i64 999
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %5, i64 %87, i64 0
  %scevgep73 = getelementptr [1000 x double], [1000 x double]* %5, i64 %87, i64 999
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536, i64 0
  store double 1.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536, i64 0
  store double 0.000000e+00, double* %89, align 8
  %90 = bitcast double* %88 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536
  %93 = bitcast [1000 x double]* %92 to i64*
  store i64 %91, i64* %93, align 8
  %94 = add nsw i64 %indvars.iv1536, -1
  %95 = add nuw nsw i64 %indvars.iv1536, 1
  %bound075 = icmp ult double* %scevgep67, %scevgep73
  %bound176 = icmp ult double* %scevgep71, %scevgep69
  %memcheck.conflict78 = and i1 %bound075, %bound176
  br i1 %memcheck.conflict78, label %.ph80.lver.orig.preheader, label %.ph80

.ph80.lver.orig.preheader:                        ; preds = %.lver.check79
  br label %.ph80.lver.orig

.ph80.lver.orig:                                  ; preds = %.ph80.lver.orig.preheader, %.ph80.lver.orig
  %indvars.iv928.lver.orig = phi i64 [ %indvars.iv.next10.lver.orig, %.ph80.lver.orig ], [ 1, %.ph80.lver.orig.preheader ]
  %96 = add nsw i64 %indvars.iv928.lver.orig, -1
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536, i64 %96
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536, i64 %indvars.iv928.lver.orig
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %94, i64 %indvars.iv928.lver.orig
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1536, i64 %indvars.iv928.lver.orig
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %95, i64 %indvars.iv928.lver.orig
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536, i64 %96
  %104 = insertelement <2 x double> undef, double %98, i32 0
  %105 = shufflevector <2 x double> %104, <2 x double> undef, <2 x i32> zeroinitializer
  %106 = fmul <2 x double> %105, <double 0xC08F400000000001, double 0xC08F400000000001>
  %107 = fadd <2 x double> %106, <double 0x409F440000000001, double 0x409F440000000001>
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fdiv double 0x408F400000000001, %108
  store double %110, double* %99, align 8
  %111 = load double, double* %100, align 8
  %112 = fmul double %111, 0xC09F400000000001
  %113 = load double, double* %101, align 8
  %114 = fmul double %113, 0xC0AF3E0000000001
  %115 = fsub double %114, %112
  %116 = load double, double* %102, align 8
  %117 = fmul double %116, 0xC09F400000000001
  %118 = fsub double %115, %117
  %119 = load double, double* %103, align 8
  %120 = fmul double %119, 0xC08F400000000001
  %121 = fsub double %118, %120
  %122 = fdiv double %121, %109
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536, i64 %indvars.iv928.lver.orig
  store double %122, double* %123, align 8
  %indvars.iv.next10.lver.orig = add nuw nsw i64 %indvars.iv928.lver.orig, 1
  %exitcond12.lver.orig = icmp eq i64 %indvars.iv.next10.lver.orig, 999
  br i1 %exitcond12.lver.orig, label %._crit_edge31.loopexit, label %.ph80.lver.orig

.ph80:                                            ; preds = %.lver.check79
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %4, i64 %86, i64 0
  %scevgep86 = getelementptr [1000 x double], [1000 x double]* %5, i64 %86, i64 0
  %load_initial82 = load double, double* %scevgep81, align 8
  %load_initial87 = load double, double* %scevgep86, align 8
  br label %124

; <label>:124:                                    ; preds = %.ph80, %124
  %store_forwarded88 = phi double [ %load_initial87, %.ph80 ], [ %146, %124 ]
  %store_forwarded85 = phi double [ %load_initial82, %.ph80 ], [ %135, %124 ]
  %indvars.iv928 = phi i64 [ 1, %.ph80 ], [ %indvars.iv.next10, %124 ]
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536, i64 %indvars.iv928
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %94, i64 %indvars.iv928
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1536, i64 %indvars.iv928
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %95, i64 %indvars.iv928
  %129 = insertelement <2 x double> undef, double %store_forwarded85, i32 0
  %130 = shufflevector <2 x double> %129, <2 x double> undef, <2 x i32> zeroinitializer
  %131 = fmul <2 x double> %130, <double 0xC08F400000000001, double 0xC08F400000000001>
  %132 = fadd <2 x double> %131, <double 0x409F440000000001, double 0x409F440000000001>
  %133 = extractelement <2 x double> %132, i32 0
  %134 = extractelement <2 x double> %132, i32 1
  %135 = fdiv double 0x408F400000000001, %133
  store double %135, double* %125, align 8
  %136 = load double, double* %126, align 8
  %137 = fmul double %136, 0xC09F400000000001
  %138 = load double, double* %127, align 8
  %139 = fmul double %138, 0xC0AF3E0000000001
  %140 = fsub double %139, %137
  %141 = load double, double* %128, align 8
  %142 = fmul double %141, 0xC09F400000000001
  %143 = fsub double %140, %142
  %144 = fmul double %store_forwarded88, 0xC08F400000000001
  %145 = fsub double %143, %144
  %146 = fdiv double %145, %134
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536, i64 %indvars.iv928
  store double %146, double* %147, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv928, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 999
  br i1 %exitcond12, label %._crit_edge31.loopexit89, label %124

._crit_edge31.loopexit:                           ; preds = %.ph80.lver.orig
  br label %._crit_edge31

._crit_edge31.loopexit89:                         ; preds = %124
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit89, %._crit_edge31.loopexit
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536, i64 999
  store double 1.000000e+00, double* %148, align 8
  br i1 true, label %.lr.ph34.preheader, label %.preheader

.lr.ph34.preheader:                               ; preds = %._crit_edge31
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34, %.lr.ph34.preheader
  %indvars.iv1332 = phi i64 [ 998, %.lr.ph34.preheader ], [ %indvars.iv.next14.1, %.lr.ph34 ]
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536, i64 %indvars.iv1332
  %150 = load double, double* %149, align 8
  %151 = or i64 %indvars.iv1332, 1
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536, i64 %151
  %153 = load double, double* %152, align 8
  %154 = fmul double %150, %153
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536, i64 %indvars.iv1332
  %156 = load double, double* %155, align 8
  %157 = fadd double %154, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536, i64 %indvars.iv1332
  store double %157, double* %158, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv1332, -1
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536, i64 %indvars.iv.next14
  %160 = load double, double* %159, align 8
  %161 = fmul double %160, %157
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536, i64 %indvars.iv.next14
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536, i64 %indvars.iv.next14
  store double %164, double* %165, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1332, -2
  %166 = icmp sgt i64 %indvars.iv.next14, 1
  br i1 %166, label %.lr.ph34, label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph34
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %._crit_edge31
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1536, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next16, 999
  %indvar.next66 = add i64 %indvar65, 1
  br i1 %exitcond46, label %.preheader._crit_edge.loopexit, label %.lver.check79

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.preheader
  %167 = add nuw nsw i32 %.0340, 1
  %exitcond48 = icmp eq i32 %.0340, 500
  br i1 %exitcond48, label %._crit_edge41.loopexit, label %.preheader4.preheader

._crit_edge41.loopexit:                           ; preds = %.preheader._crit_edge
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv26, 1000
  br label %8

; <label>:8:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %9 = add nsw i64 %indvars.iv5, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %.preheader

.preheader:                                       ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.preheader._crit_edge, label %8

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond9, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
