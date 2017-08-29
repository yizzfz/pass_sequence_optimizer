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
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge26

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %wide.trip.count29 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count32 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader19

.preheader19:                                     ; preds = %._crit_edge23, %.preheader19.lr.ph
  %indvars.iv30 = phi i64 [ 0, %.preheader19.lr.ph ], [ %indvars.iv.next31, %._crit_edge23 ]
  %8 = trunc i64 %indvars.iv30 to i32
  %9 = add i32 %8, %0
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader19
  %indvars.iv27 = phi i64 [ 0, %.preheader19 ], [ %indvars.iv.next28, %._crit_edge ]
  %10 = trunc i64 %indvars.iv27 to i32
  %11 = add i32 %9, %10
  br i1 %6, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv30, i64 %indvars.iv27, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %indvars.iv27, i64 0
  store double %14, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader ]
  br i1 %7, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.new ], [ %indvars.iv.unr.ph, %.preheader.new.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv30, i64 %indvars.iv27, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %indvars.iv27, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv30, i64 %indvars.iv27, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %indvars.iv27, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond, label %._crit_edge23, label %.preheader

._crit_edge23:                                    ; preds = %._crit_edge
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge26.loopexit, label %.preheader19

._crit_edge26.loopexit:                           ; preds = %._crit_edge23
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %wide.trip.count132 = zext i32 %4 to i64
  %wide.trip.count128 = zext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count144 = zext i32 %4 to i64
  %wide.trip.count140 = zext i32 %4 to i64
  %wide.trip.count136 = zext i32 %4 to i64
  %5 = add nsw i64 %wide.trip.count136, -1
  %6 = icmp sgt i32 %4, 1
  %min.iters.check19 = icmp ult i64 %5, 2
  %n.vec22 = and i64 %5, -2
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  %ind.end46 = or i64 %5, 1
  %cmp.n47 = icmp eq i64 %5, %n.vec22
  %7 = icmp sgt i32 %4, 1
  %min.iters.check = icmp ult i64 %5, 2
  %n.vec = and i64 %5, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %5, 1
  %cmp.n = icmp eq i64 %5, %n.vec
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %3
  %storemerge122 = phi i32 [ 1, %3 ], [ %140, %._crit_edge121 ]
  br i1 %6, label %.preheader108.preheader, label %._crit_edge121

.preheader108.preheader:                          ; preds = %.preheader110
  br label %.preheader108

.preheader109:                                    ; preds = %._crit_edge113
  br i1 %7, label %.preheader107.preheader, label %._crit_edge121

.preheader107.preheader:                          ; preds = %.preheader109
  br label %.preheader107

.preheader108:                                    ; preds = %.preheader108.preheader, %._crit_edge113
  %indvar25 = phi i64 [ %indvar.next26, %._crit_edge113 ], [ 0, %.preheader108.preheader ]
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %._crit_edge113 ], [ 1, %.preheader108.preheader ]
  %8 = add i64 %indvar25, 1
  %9 = add i64 %indvar25, 2
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %10 = add nsw i64 %indvars.iv130, -1
  br label %.preheader106

.preheader106:                                    ; preds = %._crit_edge, %.preheader108
  %indvar27 = phi i64 [ %indvar.next28, %._crit_edge ], [ 0, %.preheader108 ]
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge ], [ 1, %.preheader108 ]
  %11 = add i64 %indvar27, 1
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %11, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %11, i64 %wide.trip.count136
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar25, i64 %11, i64 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %11, i64 %wide.trip.count136
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %12 = add nsw i64 %indvars.iv126, -1
  br i1 %min.iters.check19, label %scalar.ph18.preheader, label %min.iters.checked20

min.iters.checked20:                              ; preds = %.preheader106
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
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next131, i64 %indvars.iv126, i64 %offset.idx48
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv126, i64 %offset.idx48
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %18 = fsub <2 x double> %wide.load52, %17
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv126, i64 %offset.idx48
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %wide.load54, %18
  %22 = fmul <2 x double> %21, <double 1.250000e-01, double 1.250000e-01>
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv.next127, i64 %offset.idx48
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fsub <2 x double> %wide.load55, %17
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %12, i64 %offset.idx48
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %25, %wide.load56
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = fadd <2 x double> %22, %29
  %31 = add nuw nsw i64 %offset.idx48, 1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv126, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fsub <2 x double> %wide.load57, %17
  %35 = add nsw i64 %offset.idx48, -1
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv126, i64 %35
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !1
  %38 = fadd <2 x double> %34, %wide.load58
  %39 = fmul <2 x double> %38, <double 1.250000e-01, double 1.250000e-01>
  %40 = fadd <2 x double> %30, %39
  %41 = fadd <2 x double> %wide.load53, %40
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %offset.idx48
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %41, <2 x double>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next44 = add i64 %index43, 2
  %44 = icmp eq i64 %index.next44, %n.vec22
  br i1 %44, label %middle.block17, label %vector.body16, !llvm.loop !6

middle.block17:                                   ; preds = %vector.body16
  br i1 %cmp.n47, label %._crit_edge, label %scalar.ph18.preheader

scalar.ph18.preheader:                            ; preds = %middle.block17, %vector.memcheck41, %min.iters.checked20, %.preheader106
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck41 ], [ 1, %min.iters.checked20 ], [ 1, %.preheader106 ], [ %ind.end46, %middle.block17 ]
  br label %scalar.ph18

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ %indvars.iv.ph, %scalar.ph18.preheader ]
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next131, i64 %indvars.iv126, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, 2.000000e+00
  %50 = fsub double %46, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv126, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  %54 = fmul double %53, 1.250000e-01
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv.next127, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %49
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %12, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %61 = fmul double %60, 1.250000e-01
  %62 = fadd double %54, %61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fsub double %64, %49
  %66 = add nsw i64 %indvars.iv, -1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv130, i64 %indvars.iv126, i64 %66
  %68 = load double, double* %67, align 8
  %69 = fadd double %65, %68
  %70 = fmul double %69, 1.250000e-01
  %71 = fadd double %62, %70
  %72 = fadd double %48, %71
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv
  store double %72, double* %73, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph18
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block17
  %exitcond129 = icmp eq i64 %indvars.iv.next127, %wide.trip.count128
  %indvar.next28 = add i64 %indvar27, 1
  br i1 %exitcond129, label %._crit_edge113, label %.preheader106

._crit_edge113:                                   ; preds = %._crit_edge
  %exitcond133 = icmp eq i64 %indvars.iv.next131, %wide.trip.count132
  %indvar.next26 = add i64 %indvar25, 1
  br i1 %exitcond133, label %.preheader109, label %.preheader108

.preheader107:                                    ; preds = %.preheader107.preheader, %._crit_edge119
  %indvar = phi i64 [ %indvar.next, %._crit_edge119 ], [ 0, %.preheader107.preheader ]
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %._crit_edge119 ], [ 1, %.preheader107.preheader ]
  %74 = add i64 %indvar, 1
  %75 = add i64 %indvar, 2
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %76 = add nsw i64 %indvars.iv142, -1
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge117, %.preheader107
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge117 ], [ 0, %.preheader107 ]
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge117 ], [ 1, %.preheader107 ]
  %77 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %77, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %77, i64 %wide.trip.count136
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %77, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %75, i64 %77, i64 %wide.trip.count136
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %78 = add nsw i64 %indvars.iv138, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
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
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv.next143, i64 %indvars.iv138, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv138, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %84 = fsub <2 x double> %wide.load, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %indvars.iv138, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fadd <2 x double> %wide.load11, %84
  %88 = fmul <2 x double> %87, <double 1.250000e-01, double 1.250000e-01>
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv.next139, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fsub <2 x double> %wide.load12, %83
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %78, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fadd <2 x double> %91, %wide.load13
  %95 = fmul <2 x double> %94, <double 1.250000e-01, double 1.250000e-01>
  %96 = fadd <2 x double> %88, %95
  %97 = add nuw nsw i64 %offset.idx, 1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv138, i64 %97
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fsub <2 x double> %wide.load14, %83
  %101 = add nsw i64 %offset.idx, -1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv138, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fadd <2 x double> %100, %wide.load15
  %105 = fmul <2 x double> %104, <double 1.250000e-01, double 1.250000e-01>
  %106 = fadd <2 x double> %96, %105
  %107 = fadd <2 x double> %wide.load10, %106
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv142, i64 %indvars.iv138, i64 %offset.idx
  %109 = bitcast double* %108 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %110 = icmp eq i64 %index.next, %n.vec
  br i1 %110, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge117, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv134.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %scalar.ph ], [ %indvars.iv134.ph, %scalar.ph.preheader ]
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv.next143, i64 %indvars.iv138, i64 %indvars.iv134
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv138, i64 %indvars.iv134
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, 2.000000e+00
  %116 = fsub double %112, %115
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %indvars.iv138, i64 %indvars.iv134
  %118 = load double, double* %117, align 8
  %119 = fadd double %118, %116
  %120 = fmul double %119, 1.250000e-01
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv.next139, i64 %indvars.iv134
  %122 = load double, double* %121, align 8
  %123 = fsub double %122, %115
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %78, i64 %indvars.iv134
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  %127 = fmul double %126, 1.250000e-01
  %128 = fadd double %120, %127
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv138, i64 %indvars.iv.next135
  %130 = load double, double* %129, align 8
  %131 = fsub double %130, %115
  %132 = add nsw i64 %indvars.iv134, -1
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv138, i64 %132
  %134 = load double, double* %133, align 8
  %135 = fadd double %131, %134
  %136 = fmul double %135, 1.250000e-01
  %137 = fadd double %128, %136
  %138 = fadd double %114, %137
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv142, i64 %indvars.iv138, i64 %indvars.iv134
  store double %138, double* %139, align 8
  %exitcond137 = icmp eq i64 %indvars.iv.next135, %wide.trip.count136
  br i1 %exitcond137, label %._crit_edge117.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge117.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge117

._crit_edge117:                                   ; preds = %._crit_edge117.loopexit, %middle.block
  %exitcond141 = icmp eq i64 %indvars.iv.next139, %wide.trip.count140
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %exitcond141, label %._crit_edge119, label %.preheader

._crit_edge119:                                   ; preds = %._crit_edge117
  %exitcond145 = icmp eq i64 %indvars.iv.next143, %wide.trip.count144
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond145, label %._crit_edge121.loopexit, label %.preheader107

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader110, %.preheader109
  %140 = add nuw nsw i32 %storemerge122, 1
  %exitcond146 = icmp eq i32 %140, 501
  br i1 %exitcond146, label %141, label %.preheader110

; <label>:141:                                    ; preds = %._crit_edge121
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
  br i1 %7, label %.preheader15.preheader, label %._crit_edge22

.preheader15.preheader:                           ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  %wide.trip.count29 = zext i32 %0 to i64
  br label %.preheader15

.preheader15:                                     ; preds = %._crit_edge19, %.preheader15.preheader
  %indvars.iv27 = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next28, %._crit_edge19 ]
  %9 = mul nsw i64 %indvars.iv27, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader15
  %indvars.iv23 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next24, %._crit_edge ]
  %11 = trunc i64 %indvars.iv23 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

; <label>:15:                                     ; preds = %22, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %22 ]
  %16 = add i64 %indvars.iv, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %22

; <label>:22:                                     ; preds = %20, %15
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %15

._crit_edge:                                      ; preds = %22
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %._crit_edge19, label %.preheader

._crit_edge19:                                    ; preds = %._crit_edge
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond30, label %._crit_edge22.loopexit, label %.preheader15

._crit_edge22.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
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
