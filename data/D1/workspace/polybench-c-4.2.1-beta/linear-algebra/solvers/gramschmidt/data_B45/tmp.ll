; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  br i1 true, label %.preheader27.us.preheader, label %._crit_edge30

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader27.us
  %indvars.iv41 = phi i64 [ 0, %.preheader27.us ], [ %indvars.iv.next42, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond, label %._crit_edge33.us, label %._crit_edge

._crit_edge33.us:                                 ; preds = %._crit_edge
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond54, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge33.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  br i1 true, label %.preheader.us.preheader, label %._crit_edge30

.preheader.us.preheader:                          ; preds = %.preheader26
  br i1 true, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ 0, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.prol, i64 0
  %scevgep51.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.prol, i8 0, i64 9600, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, !llvm.loop !1

._crit_edge.us.prol.._crit_edge.us.prol_crit_edge: ; preds = %._crit_edge.us.prol
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  br label %._crit_edge.us.prol

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  br i1 false, label %._crit_edge30, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  br i1 false, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol58 = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 0
  %scevgep51.prol59 = bitcast double* %scevgep.prol58 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.prol59, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 1, i64 0
  %scevgep51.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.prol, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 2, i64 0
  %scevgep51.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.prol, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 3, i64 0
  %scevgep51.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.prol, i8 0, i64 9600, i32 8, i1 false)
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv37.unr61 = phi i64 [ 0, %._crit_edge.us.3.preheader ], [ 4, %._crit_edge.us.3.prol ]
  br i1 false, label %._crit_edge30.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge30.loopexit.unr-lcssa:                 ; preds = %._crit_edge.us.3
  br label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge30.loopexit.unr-lcssa
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader.us.prol.loopexit, %.preheader26, %.preheader27.lr.ph
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr61, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next38.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 0
  %scevgep51 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38, i64 0
  %scevgep51.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1, i64 0
  %scevgep51.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2, i64 0
  %scevgep51.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.3 = add nuw nsw i64 %indvars.iv37, 4
  %scevgep.162 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.3, i64 0
  %scevgep51.163 = bitcast double* %scevgep.162 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.163, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.164 = add nsw i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.164, i64 0
  %scevgep51.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.1.1 = add nsw i64 %indvars.iv37, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.1, i64 0
  %scevgep51.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.2.1 = add nsw i64 %indvars.iv37, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.1, i64 0
  %scevgep51.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.3.1 = add nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge30.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader66.lr.ph, label %._crit_edge80

.preheader66.lr.ph:                               ; preds = %5
  br label %.preheader66

.preheader66:                                     ; preds = %._crit_edge78..preheader66_crit_edge, %.preheader66.lr.ph
  %indvars.iv114 = phi i64 [ 0, %.preheader66.lr.ph ], [ %indvars.iv.next115, %._crit_edge78..preheader66_crit_edge ]
  %indvars.iv108 = phi i64 [ 1, %.preheader66.lr.ph ], [ %indvars.iv.next109, %._crit_edge78..preheader66_crit_edge ]
  %6 = mul i64 %indvars.iv114, 1201
  %7 = add i64 %6, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %7
  %scevgep121 = bitcast double* %scevgep to i8*
  %8 = mul i64 %indvars.iv114, -8
  %9 = add i64 9592, %8
  br i1 true, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader66
  br i1 true, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %.068.prol = phi double [ %13, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv114
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %.068.prol, %12
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %13, %.prol.loopexit.loopexit ]
  %.068.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %13, %.prol.loopexit.loopexit ]
  br i1 false, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.lr.ph.new.preheader ]
  %.068 = phi double [ %29, %.lr.ph.new ], [ %.068.unr, %.lr.ph.new.preheader ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv114
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %.068, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv114
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv114
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fadd double %21, %24
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv114
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %25, %28
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond118.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond118.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader66
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader66 ], [ %.lcssa.unr, %.prol.loopexit ], [ %29, %._crit_edge.loopexit ]
  %30 = tail call double @sqrt(double %.0.lcssa) #4
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv114
  store double %30, double* %31, align 8
  br i1 true, label %.lr.ph71.preheader, label %.preheader65

.lr.ph71.preheader:                               ; preds = %._crit_edge
  br i1 true, label %.lr.ph71.prol.loopexit, label %.lr.ph71.prol

.lr.ph71.prol:                                    ; preds = %.lr.ph71.preheader
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv114
  %33 = load double, double* %32, align 8
  %34 = load double, double* %31, align 8
  %35 = fdiv double %33, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  store double %35, double* %36, align 8
  br label %.lr.ph71.prol.loopexit

.lr.ph71.prol.loopexit:                           ; preds = %.lr.ph71.preheader, %.lr.ph71.prol
  %indvars.iv90.unr.ph = phi i64 [ 1, %.lr.ph71.prol ], [ 0, %.lr.ph71.preheader ]
  br i1 false, label %.preheader65, label %.lr.ph71.preheader142

.lr.ph71.preheader142:                            ; preds = %.lr.ph71.prol.loopexit
  br label %.lr.ph71

.preheader65.loopexit:                            ; preds = %.lr.ph71
  br label %.preheader65

.preheader65:                                     ; preds = %.preheader65.loopexit, %.lr.ph71.prol.loopexit, %._crit_edge
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %37 = icmp slt i64 %indvars.iv.next115, 1200
  br i1 %37, label %.lr.ph77, label %._crit_edge78

.lr.ph77:                                         ; preds = %.preheader65
  br i1 true, label %.lr.ph77.split.us.preheader, label %._crit_edge78.loopexit89

.lr.ph77.split.us.preheader:                      ; preds = %.lr.ph77
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  br label %.lr.ph77.split.us

.lr.ph77.split.us:                                ; preds = %.loopexit.us, %.lr.ph77.split.us.preheader
  %indvars.iv110 = phi i64 [ %indvars.iv108, %.lr.ph77.split.us.preheader ], [ %indvars.iv.next111, %.loopexit.us ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %40, align 8
  br i1 true, label %.prol.loopexit123, label %.prol.preheader122

.prol.preheader122:                               ; preds = %.lr.ph77.split.us
  %41 = load double, double* %39, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %44, 0.000000e+00
  store double %45, double* %40, align 8
  br label %.prol.loopexit123

.prol.loopexit123:                                ; preds = %.lr.ph77.split.us, %.prol.preheader122
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader122 ], [ 0, %.lr.ph77.split.us ]
  %.unr.ph = phi double [ %45, %.prol.preheader122 ], [ 0.000000e+00, %.lr.ph77.split.us ]
  br i1 false, label %.preheader.us, label %.lr.ph77.split.us.new.preheader

.lr.ph77.split.us.new.preheader:                  ; preds = %.prol.loopexit123
  br label %.lr.ph77.split.us.new

.lr.ph77.split.us.new:                            ; preds = %.lr.ph77.split.us.new.preheader, %.lr.ph77.split.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph77.split.us.new ], [ %indvars.iv100.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %46 = phi double [ %58, %.lr.ph77.split.us.new ], [ %.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv114
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv110
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %46, %51
  store double %52, double* %40, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101, i64 %indvars.iv114
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next101, i64 %indvars.iv110
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %40, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond.1127 = icmp eq i64 %indvars.iv.next101.1, 1000
  br i1 %exitcond.1127, label %.preheader.us.loopexit, label %.lr.ph77.split.us.new

.preheader.us.loopexit:                           ; preds = %.lr.ph77.split.us.new
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.prol.loopexit123
  br i1 true, label %.lr.ph76.us.preheader, label %.loopexit.us

.lr.ph76.us.preheader:                            ; preds = %.preheader.us
  br i1 true, label %.lr.ph76.us.prol.loopexit, label %.lr.ph76.us.prol

.lr.ph76.us.prol:                                 ; preds = %.lr.ph76.us.preheader
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %60 = load double, double* %59, align 8
  %61 = load double, double* %38, align 8
  %62 = load double, double* %40, align 8
  %63 = fmul double %61, %62
  %64 = fsub double %60, %63
  store double %64, double* %59, align 8
  br label %.lr.ph76.us.prol.loopexit

.lr.ph76.us.prol.loopexit:                        ; preds = %.lr.ph76.us.preheader, %.lr.ph76.us.prol
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph76.us.prol ], [ 0, %.lr.ph76.us.preheader ]
  br i1 false, label %.loopexit.us, label %.lr.ph76.us.preheader141

.lr.ph76.us.preheader141:                         ; preds = %.lr.ph76.us.prol.loopexit
  br label %.lr.ph76.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader141, %.lr.ph76.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph76.us ], [ %indvars.iv104.unr.ph, %.lr.ph76.us.preheader141 ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv110
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv114
  %68 = load double, double* %67, align 8
  %69 = load double, double* %40, align 8
  %70 = fmul double %68, %69
  %71 = fsub double %66, %70
  store double %71, double* %65, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv110
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv114
  %75 = load double, double* %74, align 8
  %76 = load double, double* %40, align 8
  %77 = fmul double %75, %76
  %78 = fsub double %73, %77
  store double %78, double* %72, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond.1131 = icmp eq i64 %indvars.iv.next105.1, 1000
  br i1 %exitcond.1131, label %.loopexit.us.loopexit, label %.lr.ph76.us

.loopexit.us.loopexit:                            ; preds = %.lr.ph76.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph76.us.prol.loopexit, %.preheader.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond = icmp eq i64 %indvars.iv.next111, 1200
  br i1 %exitcond, label %._crit_edge78.loopexit, label %.lr.ph77.split.us

.lr.ph71:                                         ; preds = %.lr.ph71.preheader142, %.lr.ph71
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph71 ], [ %indvars.iv90.unr.ph, %.lr.ph71.preheader142 ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv90, i64 %indvars.iv114
  %80 = load double, double* %79, align 8
  %81 = load double, double* %31, align 8
  %82 = fdiv double %80, %81
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv90, i64 %indvars.iv114
  store double %82, double* %83, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next91, i64 %indvars.iv114
  %85 = load double, double* %84, align 8
  %86 = load double, double* %31, align 8
  %87 = fdiv double %85, %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next91, i64 %indvars.iv114
  store double %87, double* %88, align 8
  %indvars.iv.next91.1 = add nuw nsw i64 %indvars.iv90, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next91.1, 1000
  br i1 %exitcond.1, label %.preheader65.loopexit, label %.lr.ph71

._crit_edge78.loopexit89:                         ; preds = %.lr.ph77
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep121, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge78

._crit_edge78.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit, %.preheader65, %._crit_edge78.loopexit89
  %exitcond134 = icmp eq i64 %indvars.iv.next115, 1200
  br i1 %exitcond134, label %._crit_edge80.loopexit, label %._crit_edge78..preheader66_crit_edge

._crit_edge78..preheader66_crit_edge:             ; preds = %._crit_edge78
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  br label %.preheader66

._crit_edge80.loopexit:                           ; preds = %._crit_edge78
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader28.us.preheader, label %._crit_edge38

.preheader28.us.preheader:                        ; preds = %4
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next50, %._crit_edge35.us ]
  %9 = mul nsw i64 %indvars.iv49, 1200
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader28.us
  %indvars.iv45 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next46, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv45, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv45
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond54, label %._crit_edge35.us, label %._crit_edge1

._crit_edge35.us:                                 ; preds = %._crit_edge
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond55, label %._crit_edge38.loopexit, label %.preheader28.us

._crit_edge38.loopexit:                           ; preds = %._crit_edge35.us
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.preheader.us.preheader, label %._crit_edge32

.preheader.us.preheader:                          ; preds = %._crit_edge38
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge.us ]
  %24 = mul nsw i64 %indvars.iv40, 1200
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge2 ]
  %25 = add nsw i64 %indvars.iv, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge2

; <label>:29:                                     ; preds = %._crit_edge3
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond53, label %._crit_edge.us, label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge2
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond, label %._crit_edge32.loopexit, label %.preheader.us

._crit_edge32.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %._crit_edge38
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %37) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
