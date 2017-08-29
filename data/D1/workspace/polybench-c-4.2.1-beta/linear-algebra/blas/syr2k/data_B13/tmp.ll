; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader4

.preheader4:                                      ; preds = %..preheader4_crit_edge, %5
  %indvars.iv11 = phi i64 [ 0, %5 ], [ %indvars.iv.next12, %..preheader4_crit_edge ]
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader4
  %indvars.iv8 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next9, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv8, %indvars.iv11
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv8
  store double %12, double* %13, align 8
  %14 = add nuw nsw i64 %7, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv11, i64 %indvars.iv8
  store double %18, double* %19, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %20, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

; <label>:20:                                     ; preds = %6
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond13, label %.preheader.preheader, label %..preheader4_crit_edge

..preheader4_crit_edge:                           ; preds = %20
  br label %.preheader4

.preheader.preheader:                             ; preds = %20
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  br label %21

; <label>:21:                                     ; preds = %._crit_edge16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge16 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %29, label %._crit_edge16

._crit_edge16:                                    ; preds = %21
  br label %21

; <label>:29:                                     ; preds = %21
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %30, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %29
  br label %.preheader

; <label>:30:                                     ; preds = %29
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert70 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat71 = shufflevector <2 x double> %broadcast.splatinsert70, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert49 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat50 = shufflevector <2 x double> %broadcast.splatinsert49, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %.us-lcssa.us..lr.ph_crit_edge, %5
  %indvars.iv20 = phi i64 [ 0, %5 ], [ %indvars.iv.next21, %.us-lcssa.us..lr.ph_crit_edge ]
  %indvars.iv18 = phi i64 [ 1, %5 ], [ %indvars.iv.next19, %.us-lcssa.us..lr.ph_crit_edge ]
  %6 = add i64 %indvars.iv20, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 0
  %7 = mul i64 %indvars.iv20, 1201
  %8 = add i64 %7, 1
  %scevgep25 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %8
  %9 = add i64 %indvars.iv20, 1
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %10 = trunc i64 %indvars.iv.next21 to i32
  %xtraiter = and i32 %10, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv.prol
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %1
  store double %13, double* %11, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %indvars.iv20, 3
  br i1 %14, label %.prol.loopexit..preheader.preheader_crit_edge, label %.prol.loopexit..lr.ph.new_crit_edge

.prol.loopexit..preheader.preheader_crit_edge:    ; preds = %.prol.loopexit
  br label %.preheader.preheader

.prol.loopexit..lr.ph.new_crit_edge:              ; preds = %.prol.loopexit
  %15 = sub i64 %6, %indvars.iv.unr
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check54 = icmp ult i64 %17, 2
  br i1 %min.iters.check54, label %.prol.loopexit..lr.ph.new_crit_edge..lr.ph.new.preheader_crit_edge, label %min.iters.checked55

.prol.loopexit..lr.ph.new_crit_edge..lr.ph.new.preheader_crit_edge: ; preds = %.prol.loopexit..lr.ph.new_crit_edge
  br label %.lr.ph.new.preheader

min.iters.checked55:                              ; preds = %.prol.loopexit..lr.ph.new_crit_edge
  %n.mod.vf56 = and i64 %17, 1
  %n.vec57 = sub nsw i64 %17, %n.mod.vf56
  %cmp.zero58 = icmp eq i64 %n.vec57, 0
  %18 = add i64 %indvars.iv.unr, 4
  %19 = shl nuw i64 %16, 2
  %20 = add i64 %18, %19
  %21 = shl nuw nsw i64 %n.mod.vf56, 2
  %ind.end = sub i64 %20, %21
  br i1 %cmp.zero58, label %min.iters.checked55..lr.ph.new.preheader_crit_edge, label %vector.ph59

min.iters.checked55..lr.ph.new.preheader_crit_edge: ; preds = %min.iters.checked55
  br label %.lr.ph.new.preheader

vector.ph59:                                      ; preds = %min.iters.checked55
  br label %vector.body51

vector.body51:                                    ; preds = %vector.body51.vector.body51_crit_edge, %vector.ph59
  %index60 = phi i64 [ 0, %vector.ph59 ], [ %index.next61, %vector.body51.vector.body51_crit_edge ]
  %22 = shl i64 %index60, 2
  %23 = add i64 %indvars.iv.unr, %22
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %23
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %25, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec68 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec69 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %26 = fmul <2 x double> %strided.vec, %broadcast.splat71
  %27 = fmul <2 x double> %strided.vec67, %broadcast.splat71
  %28 = fmul <2 x double> %strided.vec68, %broadcast.splat71
  %29 = add nsw i64 %23, 3
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %29
  %31 = fmul <2 x double> %strided.vec69, %broadcast.splat71
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = shufflevector <2 x double> %26, <2 x double> %27, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %35 = shufflevector <2 x double> %28, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %34, <4 x double> %35, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  %index.next61 = add i64 %index60, 2
  %36 = icmp eq i64 %index.next61, %n.vec57
  br i1 %36, label %middle.block52, label %vector.body51.vector.body51_crit_edge, !llvm.loop !3

vector.body51.vector.body51_crit_edge:            ; preds = %vector.body51
  br label %vector.body51

middle.block52:                                   ; preds = %vector.body51
  %cmp.n63 = icmp eq i64 %n.mod.vf56, 0
  br i1 %cmp.n63, label %middle.block52..preheader.preheader_crit_edge, label %middle.block52..lr.ph.new.preheader_crit_edge

middle.block52..lr.ph.new.preheader_crit_edge:    ; preds = %middle.block52
  br label %.lr.ph.new.preheader

middle.block52..preheader.preheader_crit_edge:    ; preds = %middle.block52
  br label %.preheader.preheader

.lr.ph.new.preheader:                             ; preds = %middle.block52..lr.ph.new.preheader_crit_edge, %min.iters.checked55..lr.ph.new.preheader_crit_edge, %.prol.loopexit..lr.ph.new_crit_edge..lr.ph.new.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked55..lr.ph.new.preheader_crit_edge ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.new_crit_edge..lr.ph.new.preheader_crit_edge ], [ %ind.end, %middle.block52..lr.ph.new.preheader_crit_edge ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.new.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %1
  store double %39, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %1
  store double %42, double* %40, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv.next.1
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %1
  store double %45, double* %43, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv.next.2
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %1
  store double %48, double* %46, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv18
  br i1 %exitcond.3, label %.preheader.preheader.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge, !llvm.loop !6

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.preheader.preheader.loopexit:                    ; preds = %.lr.ph.new
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %middle.block52..preheader.preheader_crit_edge, %.prol.loopexit..preheader.preheader_crit_edge, %.preheader.preheader.loopexit
  %min.iters.check = icmp ult i64 %9, 2
  %n.vec = and i64 %9, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv14
  %49 = add i64 %indvars.iv14, 1
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %49
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv14
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv20, i64 %49
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv14
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv14
  br i1 %min.iters.check, label %.preheader.scalar.ph.preheader_crit_edge, label %min.iters.checked

.preheader.scalar.ph.preheader_crit_edge:         ; preds = %.preheader
  br label %scalar.ph.preheader

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %min.iters.checked.scalar.ph.preheader_crit_edge, label %vector.memcheck

min.iters.checked.scalar.ph.preheader_crit_edge:  ; preds = %min.iters.checked
  br label %scalar.ph.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %51
  %bound1 = icmp ult double* %51, %scevgep25
  %found.conflict = and i1 %bound0, %bound1
  %bound036 = icmp ult double* %scevgep, %scevgep29
  %bound137 = icmp ult double* %scevgep27, %scevgep25
  %found.conflict38 = and i1 %bound036, %bound137
  %conflict.rdx = or i1 %found.conflict, %found.conflict38
  %bound039 = icmp ult double* %scevgep, %scevgep33
  %bound140 = icmp ult double* %scevgep31, %scevgep25
  %found.conflict41 = and i1 %bound039, %bound140
  %conflict.rdx42 = or i1 %conflict.rdx, %found.conflict41
  %bound045 = icmp ult double* %scevgep, %50
  %bound146 = icmp ult double* %50, %scevgep25
  %found.conflict47 = and i1 %bound045, %bound146
  %conflict.rdx48 = or i1 %conflict.rdx42, %found.conflict47
  br i1 %conflict.rdx48, label %vector.memcheck.scalar.ph.preheader_crit_edge, label %vector.ph

vector.memcheck.scalar.ph.preheader_crit_edge:    ; preds = %vector.memcheck
  br label %scalar.ph.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %52 = or i64 %index, 1
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv14
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %52, i64 %indvars.iv14
  %55 = load double, double* %53, align 8, !alias.scope !8
  %56 = load double, double* %54, align 8, !alias.scope !8
  %57 = insertelement <2 x double> undef, double %55, i32 0
  %58 = insertelement <2 x double> %57, double %56, i32 1
  %59 = fmul <2 x double> %58, %broadcast.splat50
  %60 = load double, double* %50, align 8, !alias.scope !11
  %61 = insertelement <2 x double> undef, double %60, i32 0
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = fmul <2 x double> %59, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv14
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %52, i64 %indvars.iv14
  %66 = load double, double* %64, align 8, !alias.scope !13
  %67 = load double, double* %65, align 8, !alias.scope !13
  %68 = insertelement <2 x double> undef, double %66, i32 0
  %69 = insertelement <2 x double> %68, double %67, i32 1
  %70 = fmul <2 x double> %69, %broadcast.splat50
  %71 = load double, double* %51, align 8, !alias.scope !15
  %72 = insertelement <2 x double> undef, double %71, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> undef, <2 x i32> zeroinitializer
  %74 = fmul <2 x double> %70, %73
  %75 = fadd <2 x double> %63, %74
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !17, !noalias !19
  %78 = fadd <2 x double> %wide.load, %75
  %79 = bitcast double* %76 to <2 x double>*
  store <2 x double> %78, <2 x double>* %79, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !20

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge_crit_edge, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  br label %scalar.ph.preheader

middle.block.._crit_edge_crit_edge:               ; preds = %middle.block
  br label %._crit_edge

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %vector.memcheck.scalar.ph.preheader_crit_edge, %min.iters.checked.scalar.ph.preheader_crit_edge, %.preheader.scalar.ph.preheader_crit_edge
  %indvars.iv9.ph = phi i64 [ 0, %vector.memcheck.scalar.ph.preheader_crit_edge ], [ 0, %min.iters.checked.scalar.ph.preheader_crit_edge ], [ 0, %.preheader.scalar.ph.preheader_crit_edge ], [ %n.vec, %middle.block.scalar.ph.preheader_crit_edge ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv9.ph, %scalar.ph.preheader ]
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv14
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, %0
  %84 = load double, double* %50, align 8
  %85 = fmul double %83, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv14
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %0
  %89 = load double, double* %51, align 8
  %90 = fmul double %88, %89
  %91 = fadd double %85, %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv9
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, %indvars.iv18
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !21

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %middle.block.._crit_edge_crit_edge, %._crit_edge.loopexit
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %.us-lcssa.us, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

.us-lcssa.us:                                     ; preds = %._crit_edge
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond22, label %95, label %.us-lcssa.us..lr.ph_crit_edge

.us-lcssa.us..lr.ph_crit_edge:                    ; preds = %.us-lcssa.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  br label %.lr.ph

; <label>:95:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %..preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %19, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %18
  br label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!16, !9, !14, !12}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
