; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %4 = sitofp i32 %0 to double
  store double %4, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %17, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %17 ]
  %5 = trunc i64 %indvars.iv4 to i32
  %6 = sitofp i32 %5 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %6, %8
  %10 = fdiv double %9, 1.200000e+03
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %6, %13
  %15 = fdiv double %14, 1.200000e+03
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph35, label %.preheader7

.lr.ph35:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph35.split.us.preheader, label %.lr.ph35.split.preheader

.lr.ph35.split.preheader:                         ; preds = %.lr.ph35
  %9 = fdiv double 0.000000e+00, %2
  %wide.trip.count80 = zext i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph35.split.preheader121, label %min.iters.checked

.lr.ph35.split.preheader121:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph35.split.preheader
  %indvars.iv78.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph35.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph35.split

min.iters.checked:                                ; preds = %.lr.ph35.split.preheader
  %10 = and i32 %0, 3
  %n.mod.vf = zext i32 %10 to i64
  %n.vec = sub nsw i64 %wide.trip.count80, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph35.split.preheader121, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %9, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds double, double* %5, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> %broadcast.splat93, <2 x double>* %12, align 8
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> %broadcast.splat93, <2 x double>* %14, align 8
  %index.next = add i64 %index, 4
  %15 = icmp eq i64 %index.next, %n.vec
  br i1 %15, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %10, 0
  br i1 %cmp.n, label %.preheader7, label %.lr.ph35.split.preheader121

.lr.ph35.split.us.preheader:                      ; preds = %.lr.ph35
  %wide.trip.count72 = zext i32 %1 to i64
  %wide.trip.count76 = zext i32 %0 to i64
  %16 = add nsw i64 %wide.trip.count72, -1
  %xtraiter129 = and i64 %wide.trip.count72, 3
  %lcmp.mod130 = icmp eq i64 %xtraiter129, 0
  %17 = icmp ult i64 %16, 3
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %.lr.ph35.split.us.preheader, %._crit_edge31.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge31.us ], [ 0, %.lr.ph35.split.us.preheader ]
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv74
  store double 0.000000e+00, double* %18, align 8
  br i1 %lcmp.mod130, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph35.split.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol, %._crit_edge.prol.preheader
  %indvars.iv70.prol = phi i64 [ 0, %._crit_edge.prol.preheader ], [ %indvars.iv.next71.prol, %._crit_edge.prol ]
  %19 = phi double [ 0.000000e+00, %._crit_edge.prol.preheader ], [ %22, %._crit_edge.prol ]
  %prol.iter131 = phi i64 [ %xtraiter129, %._crit_edge.prol.preheader ], [ %prol.iter131.sub, %._crit_edge.prol ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv70.prol, i64 %indvars.iv74
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  store double %22, double* %18, align 8
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter131.sub = add i64 %prol.iter131, -1
  %prol.iter131.cmp = icmp eq i64 %prol.iter131.sub, 0
  br i1 %prol.iter131.cmp, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol, !llvm.loop !4

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph35.split.us, %._crit_edge.prol.loopexit.unr-lcssa
  %.lcssa123.unr = phi double [ undef, %.lr.ph35.split.us ], [ %22, %._crit_edge.prol.loopexit.unr-lcssa ]
  %indvars.iv70.unr = phi i64 [ 0, %.lr.ph35.split.us ], [ %indvars.iv.next71.prol, %._crit_edge.prol.loopexit.unr-lcssa ]
  %.unr132 = phi double [ 0.000000e+00, %.lr.ph35.split.us ], [ %22, %._crit_edge.prol.loopexit.unr-lcssa ]
  br i1 %17, label %._crit_edge31.us, label %.lr.ph35.split.us.new

.lr.ph35.split.us.new:                            ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph35.split.us.new
  %indvars.iv70 = phi i64 [ %indvars.iv70.unr, %.lr.ph35.split.us.new ], [ %indvars.iv.next71.3, %._crit_edge ]
  %23 = phi double [ %.unr132, %.lr.ph35.split.us.new ], [ %35, %._crit_edge ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv70, i64 %indvars.iv74
  %25 = load double, double* %24, align 8
  %26 = fadd double %23, %25
  store double %26, double* %18, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next71, i64 %indvars.iv74
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  store double %29, double* %18, align 8
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next71.1, i64 %indvars.iv74
  %31 = load double, double* %30, align 8
  %32 = fadd double %29, %31
  store double %32, double* %18, align 8
  %indvars.iv.next71.2 = add nsw i64 %indvars.iv70, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next71.2, i64 %indvars.iv74
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  store double %35, double* %18, align 8
  %indvars.iv.next71.3 = add nsw i64 %indvars.iv70, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next71.3, %wide.trip.count72
  br i1 %exitcond73.3, label %._crit_edge31.us.unr-lcssa, label %._crit_edge

._crit_edge31.us.unr-lcssa:                       ; preds = %._crit_edge
  br label %._crit_edge31.us

._crit_edge31.us:                                 ; preds = %._crit_edge.prol.loopexit, %._crit_edge31.us.unr-lcssa
  %.lcssa123 = phi double [ %.lcssa123.unr, %._crit_edge.prol.loopexit ], [ %35, %._crit_edge31.us.unr-lcssa ]
  %36 = fdiv double %.lcssa123, %2
  store double %36, double* %18, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %.preheader7.loopexit, label %.lr.ph35.split.us

.preheader7.loopexit:                             ; preds = %._crit_edge31.us
  br label %.preheader7

.preheader7.loopexit122:                          ; preds = %.lr.ph35.split
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit122, %.preheader7.loopexit, %middle.block, %6
  %37 = icmp sgt i32 %1, 0
  br i1 %37, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  br i1 %7, label %.preheader6.us.preheader, label %._crit_edge15

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count63 = zext i32 %0 to i64
  %wide.trip.count67 = zext i32 %1 to i64
  %scevgep106 = getelementptr double, double* %5, i64 %wide.trip.count63
  %38 = add nsw i64 %wide.trip.count63, -1
  %min.iters.check97 = icmp ult i32 %0, 4
  %39 = and i32 %0, 3
  %n.mod.vf99 = zext i32 %39 to i64
  %n.vec100 = sub nsw i64 %wide.trip.count63, %n.mod.vf99
  %cmp.zero101 = icmp eq i64 %n.vec100, 0
  %cmp.n112 = icmp eq i32 %39, 0
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge26.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge26.us ], [ 0, %.preheader6.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 0
  %scevgep104 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %wide.trip.count63
  br i1 %min.iters.check97, label %._crit_edge82.preheader, label %min.iters.checked98

min.iters.checked98:                              ; preds = %.preheader6.us
  br i1 %cmp.zero101, label %._crit_edge82.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked98
  %bound0 = icmp ult double* %scevgep, %scevgep106
  %bound1 = icmp ugt double* %scevgep104, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge82.preheader, label %vector.body94.preheader

vector.body94.preheader:                          ; preds = %vector.memcheck
  br label %vector.body94

vector.body94:                                    ; preds = %vector.body94.preheader, %vector.body94
  %index109 = phi i64 [ %index.next110, %vector.body94 ], [ 0, %vector.body94.preheader ]
  %40 = getelementptr inbounds double, double* %5, i64 %index109
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !6
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !6
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %index109
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !9, !noalias !6
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !9, !noalias !6
  %48 = fsub <2 x double> %wide.load118, %wide.load
  %49 = fsub <2 x double> %wide.load119, %wide.load117
  store <2 x double> %48, <2 x double>* %45, align 8, !alias.scope !9, !noalias !6
  store <2 x double> %49, <2 x double>* %47, align 8, !alias.scope !9, !noalias !6
  %index.next110 = add i64 %index109, 4
  %50 = icmp eq i64 %index.next110, %n.vec100
  br i1 %50, label %middle.block95, label %vector.body94, !llvm.loop !11

middle.block95:                                   ; preds = %vector.body94
  br i1 %cmp.n112, label %._crit_edge26.us, label %._crit_edge82.preheader

._crit_edge82.preheader:                          ; preds = %middle.block95, %vector.memcheck, %min.iters.checked98, %.preheader6.us
  %indvars.iv61.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked98 ], [ 0, %.preheader6.us ], [ %n.vec100, %middle.block95 ]
  %51 = sub nsw i64 %wide.trip.count63, %indvars.iv61.ph
  %52 = sub nsw i64 %38, %indvars.iv61.ph
  %xtraiter126 = and i64 %51, 3
  %lcmp.mod127 = icmp eq i64 %xtraiter126, 0
  br i1 %lcmp.mod127, label %._crit_edge82.prol.loopexit, label %._crit_edge82.prol.preheader

._crit_edge82.prol.preheader:                     ; preds = %._crit_edge82.preheader
  br label %._crit_edge82.prol

._crit_edge82.prol:                               ; preds = %._crit_edge82.prol, %._crit_edge82.prol.preheader
  %indvars.iv61.prol = phi i64 [ %indvars.iv.next62.prol, %._crit_edge82.prol ], [ %indvars.iv61.ph, %._crit_edge82.prol.preheader ]
  %prol.iter128 = phi i64 [ %prol.iter128.sub, %._crit_edge82.prol ], [ %xtraiter126, %._crit_edge82.prol.preheader ]
  %53 = getelementptr inbounds double, double* %5, i64 %indvars.iv61.prol
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv61.prol
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.prol, 1
  %prol.iter128.sub = add i64 %prol.iter128, -1
  %prol.iter128.cmp = icmp eq i64 %prol.iter128.sub, 0
  br i1 %prol.iter128.cmp, label %._crit_edge82.prol.loopexit.unr-lcssa, label %._crit_edge82.prol, !llvm.loop !12

._crit_edge82.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge82.prol
  br label %._crit_edge82.prol.loopexit

._crit_edge82.prol.loopexit:                      ; preds = %._crit_edge82.preheader, %._crit_edge82.prol.loopexit.unr-lcssa
  %indvars.iv61.unr = phi i64 [ %indvars.iv61.ph, %._crit_edge82.preheader ], [ %indvars.iv.next62.prol, %._crit_edge82.prol.loopexit.unr-lcssa ]
  %58 = icmp ult i64 %52, 3
  br i1 %58, label %._crit_edge26.us.loopexit, label %._crit_edge82.preheader.new

._crit_edge82.preheader.new:                      ; preds = %._crit_edge82.prol.loopexit
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82, %._crit_edge82.preheader.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr, %._crit_edge82.preheader.new ], [ %indvars.iv.next62.3, %._crit_edge82 ]
  %59 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv61
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %60
  store double %63, double* %61, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv.next62
  %67 = load double, double* %66, align 8
  %68 = fsub double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62.1
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv.next62.1
  %72 = load double, double* %71, align 8
  %73 = fsub double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next62.2 = add nsw i64 %indvars.iv61, 3
  %74 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62.2
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv.next62.2
  %77 = load double, double* %76, align 8
  %78 = fsub double %77, %75
  store double %78, double* %76, align 8
  %indvars.iv.next62.3 = add nsw i64 %indvars.iv61, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next62.3, %wide.trip.count63
  br i1 %exitcond64.3, label %._crit_edge26.us.loopexit.unr-lcssa, label %._crit_edge82, !llvm.loop !13

._crit_edge26.us.loopexit.unr-lcssa:              ; preds = %._crit_edge82
  br label %._crit_edge26.us.loopexit

._crit_edge26.us.loopexit:                        ; preds = %._crit_edge82.prol.loopexit, %._crit_edge26.us.loopexit.unr-lcssa
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %middle.block95
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %.preheader5.loopexit, label %.preheader6.us

.lr.ph35.split:                                   ; preds = %.lr.ph35.split.preheader121, %.lr.ph35.split
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %.lr.ph35.split ], [ %indvars.iv78.ph, %.lr.ph35.split.preheader121 ]
  %79 = getelementptr inbounds double, double* %5, i64 %indvars.iv78
  store double %9, double* %79, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %.preheader7.loopexit122, label %.lr.ph35.split, !llvm.loop !14

.preheader5.loopexit:                             ; preds = %._crit_edge26.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7
  br i1 %7, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %.preheader5
  %80 = fadd double %2, -1.000000e+00
  br i1 %37, label %.lr.ph12.us.preheader, label %.lr.ph12.preheader

.lr.ph12.preheader:                               ; preds = %.preheader.lr.ph
  %81 = fdiv double 0.000000e+00, %80
  %wide.trip.count55 = zext i32 %0 to i64
  %82 = add nsw i64 %wide.trip.count55, -1
  br label %.lr.ph12

.lr.ph12.us.preheader:                            ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count44 = zext i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %83 = icmp eq i32 %1, 1
  br label %.lr.ph12.us

._crit_edge13.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count44
  br i1 %exitcond50, label %._crit_edge15.loopexit, label %.lr.ph12.us

.lr.ph12.us:                                      ; preds = %.lr.ph12.us.preheader, %._crit_edge13.us-lcssa.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge13.us-lcssa.us.us ], [ 0, %.lr.ph12.us.preheader ]
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv47
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph12.us
  %indvars.iv42 = phi i64 [ %indvars.iv47, %.lr.ph12.us ], [ %indvars.iv.next43, %._crit_edge.us.us ]
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv42
  store double 0.000000e+00, double* %85, align 8
  br i1 %lcmp.mod, label %._crit_edge83.prol.loopexit.unr-lcssa, label %._crit_edge83.prol.preheader

._crit_edge83.prol.preheader:                     ; preds = %.lr.ph.us.us
  br label %._crit_edge83.prol

._crit_edge83.prol:                               ; preds = %._crit_edge83.prol.preheader
  %86 = load double, double* %84, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv42
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fadd double %89, 0.000000e+00
  store double %90, double* %85, align 8
  br label %._crit_edge83.prol.loopexit.unr-lcssa

._crit_edge83.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.us, %._crit_edge83.prol
  %.lcssa.unr.ph = phi double [ %90, %._crit_edge83.prol ], [ undef, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge83.prol ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %90, %._crit_edge83.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  br label %._crit_edge83.prol.loopexit

._crit_edge83.prol.loopexit:                      ; preds = %._crit_edge83.prol.loopexit.unr-lcssa
  br i1 %83, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge83.prol.loopexit
  br label %._crit_edge83

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge83
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge83.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge83.prol.loopexit ], [ %105, %._crit_edge.us.us.unr-lcssa ]
  %91 = fdiv double %.lcssa, %80
  store double %91, double* %85, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv47
  store double %91, double* %92, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge13.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge83:                                    ; preds = %._crit_edge83, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next.1, %._crit_edge83 ]
  %93 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %105, %._crit_edge83 ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv47
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv42
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fadd double %93, %98
  store double %99, double* %85, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv47
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv42
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = fadd double %99, %104
  store double %105, double* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge83

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %._crit_edge13
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge13 ], [ 0, %.lr.ph12.preheader ]
  %106 = sub i64 %wide.trip.count55, %indvars.iv57
  %107 = sub i64 %82, %indvars.iv57
  %xtraiter124 = and i64 %106, 3
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  br i1 %lcmp.mod125, label %._crit_edge84.prol.loopexit, label %._crit_edge84.prol.preheader

._crit_edge84.prol.preheader:                     ; preds = %.lr.ph12
  br label %._crit_edge84.prol

._crit_edge84.prol:                               ; preds = %._crit_edge84.prol, %._crit_edge84.prol.preheader
  %indvars.iv53.prol = phi i64 [ %indvars.iv57, %._crit_edge84.prol.preheader ], [ %indvars.iv.next54.prol, %._crit_edge84.prol ]
  %prol.iter = phi i64 [ %xtraiter124, %._crit_edge84.prol.preheader ], [ %prol.iter.sub, %._crit_edge84.prol ]
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv53.prol
  store double %81, double* %108, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53.prol, i64 %indvars.iv57
  store double %81, double* %109, align 8
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge84.prol.loopexit.unr-lcssa, label %._crit_edge84.prol, !llvm.loop !16

._crit_edge84.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge84.prol
  br label %._crit_edge84.prol.loopexit

._crit_edge84.prol.loopexit:                      ; preds = %.lr.ph12, %._crit_edge84.prol.loopexit.unr-lcssa
  %indvars.iv53.unr = phi i64 [ %indvars.iv57, %.lr.ph12 ], [ %indvars.iv.next54.prol, %._crit_edge84.prol.loopexit.unr-lcssa ]
  %110 = icmp ult i64 %107, 3
  br i1 %110, label %._crit_edge13, label %.lr.ph12.new

.lr.ph12.new:                                     ; preds = %._crit_edge84.prol.loopexit
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84, %.lr.ph12.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %.lr.ph12.new ], [ %indvars.iv.next54.3, %._crit_edge84 ]
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv53
  store double %81, double* %111, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv57
  store double %81, double* %112, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next54
  store double %81, double* %113, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next54, i64 %indvars.iv57
  store double %81, double* %114, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next54.1
  store double %81, double* %115, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next54.1, i64 %indvars.iv57
  store double %81, double* %116, align 8
  %indvars.iv.next54.2 = add nsw i64 %indvars.iv53, 3
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next54.2
  store double %81, double* %117, align 8
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next54.2, i64 %indvars.iv57
  store double %81, double* %118, align 8
  %indvars.iv.next54.3 = add nsw i64 %indvars.iv53, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next54.3, %wide.trip.count55
  br i1 %exitcond56.3, label %._crit_edge13.unr-lcssa, label %._crit_edge84

._crit_edge13.unr-lcssa:                          ; preds = %._crit_edge84
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge84.prol.loopexit, %._crit_edge13.unr-lcssa
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count55
  br i1 %exitcond60, label %._crit_edge15.loopexit120, label %.lr.ph12

._crit_edge15.loopexit:                           ; preds = %._crit_edge13.us-lcssa.us.us
  br label %._crit_edge15

._crit_edge15.loopexit120:                        ; preds = %._crit_edge13
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit120, %._crit_edge15.loopexit, %.preheader6.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !2, !3}
!12 = distinct !{!12, !5}
!13 = distinct !{!13, !2, !3}
!14 = distinct !{!14, !15, !2, !3}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !5}
