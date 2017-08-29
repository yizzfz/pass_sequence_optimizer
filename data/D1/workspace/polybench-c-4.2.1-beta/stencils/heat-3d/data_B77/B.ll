; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader23.lr.ph, label %._crit_edge29

.preheader23.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = zext i32 %0 to i64
  %xtraiter = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader23.lr.ph, %._crit_edge26.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge26.us ], [ 0, %.preheader23.lr.ph ]
  %8 = trunc i64 %indvars.iv43 to i32
  %9 = add i32 %8, %0
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next44, %6
  br i1 %exitcond47, label %._crit_edge29.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv39 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next40, %._crit_edge.us.us ]
  %10 = trunc i64 %indvars.iv39 to i32
  %11 = add i32 %9, %10
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv43, i64 %indvars.iv39, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv43, i64 %indvars.iv39, i64 0
  store double %14, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %7, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, %6
  br i1 %exitcond, label %._crit_edge26.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv43, i64 %indvars.iv39, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv43, i64 %indvars.iv39, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv43, i64 %indvars.iv39, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv43, i64 %indvars.iv39, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %6
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %5 = icmp sgt i32 %4, 1
  %6 = icmp sgt i32 %4, 1
  %7 = icmp sgt i32 %4, 1
  %8 = icmp sgt i32 %4, 1
  %9 = zext i32 %4 to i64
  %10 = zext i32 %4 to i64
  %11 = zext i32 %4 to i64
  %12 = zext i32 %4 to i64
  %wide.trip.count135 = zext i32 %4 to i64
  %wide.trip.count147 = zext i32 %4 to i64
  %13 = add nsw i64 %11, -1
  %min.iters.check19 = icmp ult i64 %13, 2
  %n.vec22 = and i64 %13, -2
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  %ind.end46 = or i64 %13, 1
  %cmp.n47 = icmp eq i64 %13, %n.vec22
  %min.iters.check = icmp ult i64 %13, 2
  %n.vec = and i64 %13, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %13, 1
  %cmp.n = icmp eq i64 %13, %n.vec
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge131, %3
  %.0111132 = phi i32 [ 1, %3 ], [ %148, %._crit_edge131 ]
  br i1 %5, label %.preheader114.preheader, label %.preheader115

.preheader114.preheader:                          ; preds = %.preheader116
  br label %.preheader114

.preheader115.loopexit:                           ; preds = %._crit_edge120
  br label %.preheader115

.preheader115:                                    ; preds = %.preheader115.loopexit, %.preheader116
  br i1 %7, label %.preheader113.preheader, label %._crit_edge131

.preheader113.preheader:                          ; preds = %.preheader115
  br label %.preheader113

.preheader114:                                    ; preds = %.preheader114.preheader, %._crit_edge120
  %indvar25 = phi i64 [ %indvar.next26, %._crit_edge120 ], [ 0, %.preheader114.preheader ]
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge120 ], [ 1, %.preheader114.preheader ]
  %14 = add i64 %indvar25, 1
  %15 = add i64 %indvar25, 2
  br i1 %6, label %.preheader112.lr.ph, label %._crit_edge120

.preheader112.lr.ph:                              ; preds = %.preheader114
  %16 = add nuw nsw i64 %indvars.iv137, 1
  %17 = add nsw i64 %indvars.iv137, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader112.lr.ph
  %indvar27 = phi i64 [ %indvar.next28, %._crit_edge.us ], [ 0, %.preheader112.lr.ph ]
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge.us ], [ 1, %.preheader112.lr.ph ]
  %18 = add i64 %indvar27, 1
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %14, i64 %18, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %14, i64 %18, i64 %11
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar25, i64 %18, i64 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %18, i64 %11
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %19 = add nsw i64 %indvars.iv133, -1
  br i1 %min.iters.check19, label %scalar.ph18.preheader, label %min.iters.checked20

min.iters.checked20:                              ; preds = %.preheader112.us
  br i1 %cmp.zero23, label %scalar.ph18.preheader, label %vector.memcheck41

vector.memcheck41:                                ; preds = %min.iters.checked20
  %bound037 = icmp ult double* %scevgep29, %scevgep35
  %bound138 = icmp ult double* %scevgep33, %scevgep31
  %memcheck.conflict40 = and i1 %bound037, %bound138
  br i1 %memcheck.conflict40, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck41
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index43 = phi i64 [ %index.next44, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx48 = or i64 %index43, 1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %16, i64 %indvars.iv133, i64 %offset.idx48
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv133, i64 %offset.idx48
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %25 = fsub <2 x double> %wide.load52, %24
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %17, i64 %indvars.iv133, i64 %offset.idx48
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load54, %25
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv.next134, i64 %offset.idx48
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fsub <2 x double> %wide.load55, %24
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %19, i64 %offset.idx48
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %32, %wide.load56
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %29, %36
  %38 = add nuw nsw i64 %offset.idx48, 1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv133, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fsub <2 x double> %wide.load57, %24
  %42 = add nsw i64 %offset.idx48, -1
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv133, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = fadd <2 x double> %41, %wide.load58
  %46 = fmul <2 x double> %45, <double 1.250000e-01, double 1.250000e-01>
  %47 = fadd <2 x double> %37, %46
  %48 = fadd <2 x double> %wide.load53, %47
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv137, i64 %indvars.iv133, i64 %offset.idx48
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !4, !noalias !1
  %index.next44 = add i64 %index43, 2
  %51 = icmp eq i64 %index.next44, %n.vec22
  br i1 %51, label %middle.block17, label %vector.body16, !llvm.loop !6

middle.block17:                                   ; preds = %vector.body16
  br i1 %cmp.n47, label %._crit_edge.us, label %scalar.ph18.preheader

scalar.ph18.preheader:                            ; preds = %middle.block17, %vector.memcheck41, %min.iters.checked20, %.preheader112.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck41 ], [ 1, %min.iters.checked20 ], [ 1, %.preheader112.us ], [ %ind.end46, %middle.block17 ]
  br label %scalar.ph18

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ %indvars.iv.ph, %scalar.ph18.preheader ]
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %16, i64 %indvars.iv133, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv133, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, 2.000000e+00
  %57 = fsub double %53, %56
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %17, i64 %indvars.iv133, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  %61 = fmul double %60, 1.250000e-01
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv.next134, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fsub double %63, %56
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %19, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = fmul double %67, 1.250000e-01
  %69 = fadd double %61, %68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv133, i64 %indvars.iv.next
  %71 = load double, double* %70, align 8
  %72 = fsub double %71, %56
  %73 = add nsw i64 %indvars.iv, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv137, i64 %indvars.iv133, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %72, %75
  %77 = fmul double %76, 1.250000e-01
  %78 = fadd double %69, %77
  %79 = fadd double %55, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv137, i64 %indvars.iv133, i64 %indvars.iv
  store double %79, double* %80, align 8
  %exitcond154 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond154, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block17
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  %indvar.next28 = add i64 %indvar27, 1
  br i1 %exitcond136, label %._crit_edge120.loopexit, label %.preheader112.us

._crit_edge120.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge120

._crit_edge120:                                   ; preds = %._crit_edge120.loopexit, %.preheader114
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond = icmp eq i64 %indvars.iv.next138, %10
  %indvar.next26 = add i64 %indvar25, 1
  br i1 %exitcond, label %.preheader115.loopexit, label %.preheader114

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge128
  %indvar = phi i64 [ %indvar.next, %._crit_edge128 ], [ 0, %.preheader113.preheader ]
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge128 ], [ 1, %.preheader113.preheader ]
  %81 = add i64 %indvar, 1
  %82 = add i64 %indvar, 2
  br i1 %8, label %.preheader.lr.ph, label %._crit_edge128

.preheader.lr.ph:                                 ; preds = %.preheader113
  %83 = add nuw nsw i64 %indvars.iv149, 1
  %84 = add nsw i64 %indvars.iv149, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge125.us, %.preheader.lr.ph
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge125.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge125.us ], [ 1, %.preheader.lr.ph ]
  %85 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %81, i64 %85, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %81, i64 %85, i64 %11
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %85, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %82, i64 %85, i64 %11
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %86 = add nsw i64 %indvars.iv145, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %indvars.iv145, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv145, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %92 = fsub <2 x double> %wide.load, %91
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %84, i64 %indvars.iv145, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %wide.load11, %92
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv.next146, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fsub <2 x double> %wide.load12, %91
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %86, i64 %offset.idx
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %99, %wide.load13
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %96, %103
  %105 = add nuw nsw i64 %offset.idx, 1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv145, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fsub <2 x double> %wide.load14, %91
  %109 = add nsw i64 %offset.idx, -1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv145, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fadd <2 x double> %108, %wide.load15
  %113 = fmul <2 x double> %112, <double 1.250000e-01, double 1.250000e-01>
  %114 = fadd <2 x double> %104, %113
  %115 = fadd <2 x double> %wide.load10, %114
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv149, i64 %indvars.iv145, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  store <2 x double> %115, <2 x double>* %117, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %118 = icmp eq i64 %index.next, %n.vec
  br i1 %118, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge125.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv141.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %scalar.ph ], [ %indvars.iv141.ph, %scalar.ph.preheader ]
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %indvars.iv145, i64 %indvars.iv141
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv145, i64 %indvars.iv141
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 2.000000e+00
  %124 = fsub double %120, %123
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %84, i64 %indvars.iv145, i64 %indvars.iv141
  %126 = load double, double* %125, align 8
  %127 = fadd double %126, %124
  %128 = fmul double %127, 1.250000e-01
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv.next146, i64 %indvars.iv141
  %130 = load double, double* %129, align 8
  %131 = fsub double %130, %123
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %86, i64 %indvars.iv141
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = fmul double %134, 1.250000e-01
  %136 = fadd double %128, %135
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv145, i64 %indvars.iv.next142
  %138 = load double, double* %137, align 8
  %139 = fsub double %138, %123
  %140 = add nsw i64 %indvars.iv141, -1
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv149, i64 %indvars.iv145, i64 %140
  %142 = load double, double* %141, align 8
  %143 = fadd double %139, %142
  %144 = fmul double %143, 1.250000e-01
  %145 = fadd double %136, %144
  %146 = fadd double %122, %145
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv149, i64 %indvars.iv145, i64 %indvars.iv141
  store double %146, double* %147, align 8
  %exitcond155 = icmp eq i64 %indvars.iv.next142, %11
  br i1 %exitcond155, label %._crit_edge125.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge125.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %._crit_edge125.us.loopexit, %middle.block
  %exitcond148 = icmp eq i64 %indvars.iv.next146, %wide.trip.count147
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %exitcond148, label %._crit_edge128.loopexit, label %.preheader.us

._crit_edge128.loopexit:                          ; preds = %._crit_edge125.us
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit, %.preheader113
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond156 = icmp eq i64 %indvars.iv.next150, %12
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond156, label %._crit_edge131.loopexit, label %.preheader113

._crit_edge131.loopexit:                          ; preds = %._crit_edge128
  br label %._crit_edge131

._crit_edge131:                                   ; preds = %._crit_edge131.loopexit, %.preheader115
  %148 = add nuw nsw i32 %.0111132, 1
  %exitcond153 = icmp eq i32 %148, 501
  br i1 %exitcond153, label %149, label %.preheader116

; <label>:149:                                    ; preds = %._crit_edge131
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader20.lr.ph, label %._crit_edge27

.preheader20.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %0 to i64
  %11 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader20.lr.ph, %._crit_edge24.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge24.us ], [ 0, %.preheader20.lr.ph ]
  %12 = mul nsw i64 %indvars.iv42, %8
  %13 = trunc i64 %12 to i32
  br label %.preheader.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next43, %11
  br i1 %exitcond47, label %._crit_edge27.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %14 = trunc i64 %indvars.iv38 to i32
  %15 = add i32 %14, %13
  %16 = mul i32 %15, %0
  %17 = zext i32 %16 to i64
  br label %18

._crit_edge.us.us:                                ; preds = %25
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next39, %10
  br i1 %exitcond46, label %._crit_edge24.us, label %.preheader.us.us

; <label>:18:                                     ; preds = %25, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %25 ], [ 0, %.preheader.us.us ]
  %19 = add i64 %indvars.iv, %17
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %25

; <label>:25:                                     ; preds = %23, %18
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv42, i64 %indvars.iv38, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond, label %._crit_edge.us.us, label %18

._crit_edge27.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %2
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
