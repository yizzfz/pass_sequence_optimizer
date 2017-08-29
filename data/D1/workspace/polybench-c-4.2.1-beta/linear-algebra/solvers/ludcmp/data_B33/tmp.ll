; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
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
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  %6 = alloca [2000 x double]*, align 8
  %7 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %6, align 8
  %8 = sitofp i32 %0 to double
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph60, label %..preheader14._crit_edge_crit_edge

..preheader14._crit_edge_crit_edge:               ; preds = %5
  br label %.preheader14._crit_edge

.lr.ph60:                                         ; preds = %5
  %10 = sext i32 %0 to i64
  br label %._crit_edge

.preheader14:                                     ; preds = %._crit_edge
  %11 = add i32 %0, -1
  %wide.trip.count = sext i32 %11 to i64
  br label %.preheader13

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph60
  %indvars.iv124 = phi i64 [ 0, %.lr.ph60 ], [ %indvars.iv.next125, %._crit_edge.._crit_edge_crit_edge ]
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv124
  store double 0.000000e+00, double* %12, align 8
  %13 = getelementptr inbounds double, double* %4, i64 %indvars.iv124
  store double 0.000000e+00, double* %13, align 8
  %indvars.iv.next125 = add nsw i64 %indvars.iv124, 1
  %14 = trunc i64 %indvars.iv.next125 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 5.000000e-01
  %18 = fadd double %17, 4.000000e+00
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv124
  store double %18, double* %19, align 8
  %20 = icmp slt i64 %indvars.iv.next125, %10
  br i1 %20, label %._crit_edge.._crit_edge_crit_edge, label %.preheader14

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge50..preheader13_crit_edge, %.preheader14
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge50..preheader13_crit_edge ], [ 0, %.preheader14 ]
  %indvars.iv118.in = phi i32 [ %indvars.iv118, %._crit_edge50..preheader13_crit_edge ], [ 0, %.preheader14 ]
  %indvars.iv114 = phi i32 [ %indvars.iv.next115, %._crit_edge50..preheader13_crit_edge ], [ 0, %.preheader14 ]
  %21 = sub i64 %wide.trip.count, %indvars.iv122
  %indvars.iv118 = add i32 %indvars.iv118.in, 1
  %22 = sext i32 %indvars.iv118 to i64
  %23 = icmp slt i64 %indvars.iv122, 0
  br i1 %23, label %.preheader13.._crit_edge44_crit_edge, label %.lr.ph43

.preheader13.._crit_edge44_crit_edge:             ; preds = %.preheader13
  br label %._crit_edge44

.lr.ph43:                                         ; preds = %.preheader13
  %wide.trip.count116 = zext i32 %indvars.iv114 to i64
  br label %24

; <label>:24:                                     ; preds = %._crit_edge203, %.lr.ph43
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge203 ], [ 0, %.lr.ph43 ]
  %25 = sub nsw i64 0, %indvars.iv110
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, %0
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, %8
  %30 = fadd double %29, 1.000000e+00
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv122, i64 %indvars.iv110
  store double %30, double* %31, align 8
  %exitcond117 = icmp eq i64 %indvars.iv110, %wide.trip.count116
  br i1 %exitcond117, label %._crit_edge44.loopexit, label %._crit_edge203

._crit_edge203:                                   ; preds = %24
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  br label %24

._crit_edge44.loopexit:                           ; preds = %24
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %.preheader13.._crit_edge44_crit_edge, %._crit_edge44.loopexit
  %indvars.iv.next123 = add i64 %indvars.iv122, 1
  %32 = icmp slt i64 %indvars.iv.next123, %10
  br i1 %32, label %.lr.ph49.preheader, label %._crit_edge54.critedge

.lr.ph49.preheader:                               ; preds = %._crit_edge44
  %min.iters.check = icmp ult i64 %21, 4
  br i1 %min.iters.check, label %.lr.ph49.preheader..lr.ph49.preheader202_crit_edge, label %min.iters.checked

.lr.ph49.preheader..lr.ph49.preheader202_crit_edge: ; preds = %.lr.ph49.preheader
  br label %.lr.ph49.preheader202

min.iters.checked:                                ; preds = %.lr.ph49.preheader
  %n.vec = and i64 %21, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %22, %n.vec
  br i1 %cmp.zero, label %min.iters.checked..lr.ph49.preheader202_crit_edge, label %vector.body.preheader

min.iters.checked..lr.ph49.preheader202_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph49.preheader202

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %33 = add i64 %22, %index
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv122, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %index.next = add i64 %index, 4
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %21, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge50_crit_edge, label %middle.block..lr.ph49.preheader202_crit_edge

middle.block..lr.ph49.preheader202_crit_edge:     ; preds = %middle.block
  br label %.lr.ph49.preheader202

middle.block.._crit_edge50_crit_edge:             ; preds = %middle.block
  br label %._crit_edge50

.lr.ph49.preheader202:                            ; preds = %middle.block..lr.ph49.preheader202_crit_edge, %min.iters.checked..lr.ph49.preheader202_crit_edge, %.lr.ph49.preheader..lr.ph49.preheader202_crit_edge
  %indvars.iv120.ph = phi i64 [ %22, %min.iters.checked..lr.ph49.preheader202_crit_edge ], [ %22, %.lr.ph49.preheader..lr.ph49.preheader202_crit_edge ], [ %ind.end, %middle.block..lr.ph49.preheader202_crit_edge ]
  br label %.lr.ph49

.lr.ph49:                                         ; preds = %.lr.ph49..lr.ph49_crit_edge, %.lr.ph49.preheader202
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %.lr.ph49..lr.ph49_crit_edge ], [ %indvars.iv120.ph, %.lr.ph49.preheader202 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv122, i64 %indvars.iv120
  store double 0.000000e+00, double* %39, align 8
  %exitcond = icmp eq i64 %indvars.iv120, %wide.trip.count
  br i1 %exitcond, label %._crit_edge50.loopexit, label %.lr.ph49..lr.ph49_crit_edge, !llvm.loop !4

.lr.ph49..lr.ph49_crit_edge:                      ; preds = %.lr.ph49
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  br label %.lr.ph49

._crit_edge50.loopexit:                           ; preds = %.lr.ph49
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %middle.block.._crit_edge50_crit_edge, %._crit_edge50.loopexit
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv122, i64 %indvars.iv122
  store double 1.000000e+00, double* %40, align 8
  br i1 true, label %._crit_edge50..preheader13_crit_edge, label %.preheader14._crit_edge.loopexit

._crit_edge50..preheader13_crit_edge:             ; preds = %._crit_edge50
  %indvars.iv.next115 = add i32 %indvars.iv114, 1
  br label %.preheader13

._crit_edge54.critedge:                           ; preds = %._crit_edge44
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv122, i64 %indvars.iv122
  store double 1.000000e+00, double* %41, align 8
  br label %.preheader14._crit_edge

.preheader14._crit_edge.loopexit:                 ; preds = %._crit_edge50
  br label %.preheader14._crit_edge

.preheader14._crit_edge:                          ; preds = %..preheader14._crit_edge_crit_edge, %.preheader14._crit_edge.loopexit, %._crit_edge54.critedge
  %42 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %43 = bitcast [2000 x [2000 x double]]** %7 to i8**
  store i8* %42, i8** %43, align 8
  %44 = bitcast i8* %42 to [2000 x [2000 x double]]*
  %45 = bitcast i8* %42 to [2000 x [2000 x double]]*
  br i1 %9, label %.preheader12.lr.ph..preheader12.us_crit_edge, label %.preheader14._crit_edge.._crit_edge1.preheader_crit_edge

.preheader14._crit_edge.._crit_edge1.preheader_crit_edge: ; preds = %.preheader14._crit_edge
  br label %._crit_edge1.preheader

.preheader12.lr.ph..preheader12.us_crit_edge:     ; preds = %.preheader14._crit_edge
  %46 = add i32 %0, -1
  %47 = zext i32 %46 to i64
  %48 = shl nuw nsw i64 %47, 3
  %49 = add nuw nsw i64 %48, 8
  %50 = sext i32 %0 to i64
  br label %._crit_edge36.us

._crit_edge36.us:                                 ; preds = %._crit_edge36.us.._crit_edge36.us_crit_edge, %.preheader12.lr.ph..preheader12.us_crit_edge
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge36.us.._crit_edge36.us_crit_edge ], [ 0, %.preheader12.lr.ph..preheader12.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %._crit_edge36.us.._crit_edge36.us_crit_edge ], [ 0, %.preheader12.lr.ph..preheader12.us_crit_edge ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvar, i64 0
  %scevgep106 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep106, i8 0, i64 %49, i32 8, i1 false)
  %indvars.iv.next108 = add i64 %indvars.iv107, 1
  %51 = icmp slt i64 %indvars.iv.next108, %50
  br i1 %51, label %._crit_edge36.us.._crit_edge36.us_crit_edge, label %._crit_edge36.us...preheader11_crit_edge_crit_edge

._crit_edge36.us.._crit_edge36.us_crit_edge:      ; preds = %._crit_edge36.us
  %indvar.next = add i64 %indvar, 1
  br label %._crit_edge36.us

._crit_edge36.us...preheader11_crit_edge_crit_edge: ; preds = %._crit_edge36.us
  br i1 true, label %._crit_edge.preheader.lr.ph, label %._crit_edge36.us...preheader11_crit_edge_crit_edge.._crit_edge1.preheader_crit_edge

._crit_edge36.us...preheader11_crit_edge_crit_edge.._crit_edge1.preheader_crit_edge: ; preds = %._crit_edge36.us...preheader11_crit_edge_crit_edge
  br label %._crit_edge1.preheader

._crit_edge.preheader.lr.ph:                      ; preds = %._crit_edge36.us...preheader11_crit_edge_crit_edge
  %52 = add nuw nsw i64 %47, 1
  %min.iters.check141 = icmp ult i64 %52, 4
  %n.vec144 = and i64 %52, 8589934588
  %cmp.zero145 = icmp eq i64 %n.vec144, 0
  %cmp.n163 = icmp eq i64 %52, %n.vec144
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us-lcssa.us.us.._crit_edge.preheader.us_crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv102 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %53, %._crit_edge._crit_edge.us-lcssa.us.us.._crit_edge.preheader.us_crit_edge ]
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv102
  %53 = add i64 %indvars.iv102, 1
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %1, i64 %47, i64 %53
  br label %.preheader10.us.us

._crit_edge._crit_edge.us-lcssa.us.us:            ; preds = %._crit_edge.us.us
  %54 = icmp slt i64 %53, %50
  br i1 %54, label %._crit_edge._crit_edge.us-lcssa.us.us.._crit_edge.preheader.us_crit_edge, label %._crit_edge1.preheader.loopexit

._crit_edge._crit_edge.us-lcssa.us.us.._crit_edge.preheader.us_crit_edge: ; preds = %._crit_edge._crit_edge.us-lcssa.us.us
  br label %._crit_edge.preheader.us

.preheader10.us.us:                               ; preds = %._crit_edge.us.us..preheader10.us.us_crit_edge, %._crit_edge.preheader.us
  %indvars.iv100 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next101, %._crit_edge.us.us..preheader10.us.us_crit_edge ]
  %scevgep147 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv100, i64 0
  %scevgep149 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv100, i64 %52
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv102
  br i1 %min.iters.check141, label %.preheader10.us.us.scalar.ph140.preheader_crit_edge, label %min.iters.checked142

.preheader10.us.us.scalar.ph140.preheader_crit_edge: ; preds = %.preheader10.us.us
  br label %scalar.ph140.preheader

scalar.ph140.preheader:                           ; preds = %middle.block139.scalar.ph140.preheader_crit_edge, %vector.memcheck.scalar.ph140.preheader_crit_edge, %min.iters.checked142.scalar.ph140.preheader_crit_edge, %.preheader10.us.us.scalar.ph140.preheader_crit_edge
  %indvars.iv96.ph = phi i64 [ 0, %vector.memcheck.scalar.ph140.preheader_crit_edge ], [ 0, %min.iters.checked142.scalar.ph140.preheader_crit_edge ], [ 0, %.preheader10.us.us.scalar.ph140.preheader_crit_edge ], [ %n.vec144, %middle.block139.scalar.ph140.preheader_crit_edge ]
  br label %scalar.ph140

min.iters.checked142:                             ; preds = %.preheader10.us.us
  br i1 %cmp.zero145, label %min.iters.checked142.scalar.ph140.preheader_crit_edge, label %vector.memcheck

min.iters.checked142.scalar.ph140.preheader_crit_edge: ; preds = %min.iters.checked142
  br label %scalar.ph140.preheader

vector.memcheck:                                  ; preds = %min.iters.checked142
  %bound0 = icmp ult double* %scevgep147, %scevgep153
  %bound1 = icmp ult double* %scevgep151, %scevgep149
  %found.conflict = and i1 %bound0, %bound1
  %bound0156 = icmp ult double* %scevgep147, %55
  %bound1157 = icmp ult double* %55, %scevgep149
  %found.conflict158 = and i1 %bound0156, %bound1157
  %conflict.rdx = or i1 %found.conflict, %found.conflict158
  br i1 %conflict.rdx, label %vector.memcheck.scalar.ph140.preheader_crit_edge, label %vector.body138.preheader

vector.memcheck.scalar.ph140.preheader_crit_edge: ; preds = %vector.memcheck
  br label %scalar.ph140.preheader

vector.body138.preheader:                         ; preds = %vector.memcheck
  br label %vector.body138

vector.body138:                                   ; preds = %vector.body138.vector.body138_crit_edge, %vector.body138.preheader
  %index160 = phi i64 [ %index.next161, %vector.body138.vector.body138_crit_edge ], [ 0, %vector.body138.preheader ]
  %56 = or i64 %index160, 1
  %57 = or i64 %index160, 2
  %58 = or i64 %index160, 3
  %59 = load double, double* %55, align 8, !alias.scope !6
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index160, i64 %indvars.iv102
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv102
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv102
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv102
  %66 = load double, double* %62, align 8, !alias.scope !9
  %67 = load double, double* %63, align 8, !alias.scope !9
  %68 = load double, double* %64, align 8, !alias.scope !9
  %69 = load double, double* %65, align 8, !alias.scope !9
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = fmul <2 x double> %61, %71
  %75 = fmul <2 x double> %61, %73
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv100, i64 %index160
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !11, !noalias !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !11, !noalias !13
  %80 = fadd <2 x double> %74, %wide.load
  %81 = fadd <2 x double> %75, %wide.load168
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !11, !noalias !13
  %index.next161 = add i64 %index160, 4
  %82 = icmp eq i64 %index.next161, %n.vec144
  br i1 %82, label %middle.block139, label %vector.body138.vector.body138_crit_edge, !llvm.loop !14

vector.body138.vector.body138_crit_edge:          ; preds = %vector.body138
  br label %vector.body138

middle.block139:                                  ; preds = %vector.body138
  br i1 %cmp.n163, label %middle.block139.._crit_edge.us.us_crit_edge, label %middle.block139.scalar.ph140.preheader_crit_edge

middle.block139.scalar.ph140.preheader_crit_edge: ; preds = %middle.block139
  br label %scalar.ph140.preheader

middle.block139.._crit_edge.us.us_crit_edge:      ; preds = %middle.block139
  br label %._crit_edge.us.us

._crit_edge.us.us.loopexit:                       ; preds = %scalar.ph140
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %middle.block139.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next101 = add i64 %indvars.iv100, 1
  %83 = icmp slt i64 %indvars.iv.next101, %50
  br i1 %83, label %._crit_edge.us.us..preheader10.us.us_crit_edge, label %._crit_edge._crit_edge.us-lcssa.us.us

._crit_edge.us.us..preheader10.us.us_crit_edge:   ; preds = %._crit_edge.us.us
  br label %.preheader10.us.us

scalar.ph140:                                     ; preds = %scalar.ph140.scalar.ph140_crit_edge, %scalar.ph140.preheader
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %scalar.ph140.scalar.ph140_crit_edge ], [ %indvars.iv96.ph, %scalar.ph140.preheader ]
  %84 = load double, double* %55, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv102
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv100, i64 %indvars.iv96
  %89 = load double, double* %88, align 8
  %90 = fadd double %87, %89
  store double %90, double* %88, align 8
  %exitcond99 = icmp eq i64 %indvars.iv96, %47
  br i1 %exitcond99, label %._crit_edge.us.us.loopexit, label %scalar.ph140.scalar.ph140_crit_edge, !llvm.loop !15

scalar.ph140.scalar.ph140_crit_edge:              ; preds = %scalar.ph140
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  br label %scalar.ph140

._crit_edge1.preheader.loopexit:                  ; preds = %._crit_edge._crit_edge.us-lcssa.us.us
  br label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge36.us...preheader11_crit_edge_crit_edge.._crit_edge1.preheader_crit_edge, %.preheader14._crit_edge.._crit_edge1.preheader_crit_edge, %._crit_edge1.preheader.loopexit
  br i1 %9, label %.preheader.lr.ph, label %._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge

._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge: ; preds = %._crit_edge1.preheader
  %.pre = load i8*, i8** %43, align 8
  br label %._crit_edge1.preheader._crit_edge

.preheader.lr.ph:                                 ; preds = %._crit_edge1.preheader
  %91 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %92 = load [2000 x double]*, [2000 x double]** %6, align 8
  %93 = bitcast [2000 x [2000 x double]]* %91 to i8*
  %94 = add i32 %0, -1
  %95 = sext i32 %0 to i64
  %wide.trip.count92 = zext i32 %94 to i64
  %96 = add nuw nsw i64 %wide.trip.count92, 1
  %min.iters.check172 = icmp ult i64 %96, 4
  %n.vec175 = and i64 %96, 8589934588
  %cmp.zero176 = icmp eq i64 %n.vec175, 0
  %cmp.n195 = icmp eq i64 %96, %n.vec175
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge1.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv94 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next95, %._crit_edge1.us..preheader.us_crit_edge ]
  %scevgep178 = getelementptr [2000 x double], [2000 x double]* %92, i64 %indvars.iv94, i64 0
  %scevgep180 = getelementptr [2000 x double], [2000 x double]* %92, i64 %indvars.iv94, i64 %96
  %scevgep182 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %91, i64 0, i64 %indvars.iv94, i64 0
  %scevgep184 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %91, i64 0, i64 %indvars.iv94, i64 %96
  br i1 %min.iters.check172, label %.preheader.us.scalar.ph171.preheader_crit_edge, label %min.iters.checked173

.preheader.us.scalar.ph171.preheader_crit_edge:   ; preds = %.preheader.us
  br label %scalar.ph171.preheader

min.iters.checked173:                             ; preds = %.preheader.us
  br i1 %cmp.zero176, label %min.iters.checked173.scalar.ph171.preheader_crit_edge, label %vector.memcheck190

min.iters.checked173.scalar.ph171.preheader_crit_edge: ; preds = %min.iters.checked173
  br label %scalar.ph171.preheader

vector.memcheck190:                               ; preds = %min.iters.checked173
  %bound0186 = icmp ult double* %scevgep178, %scevgep184
  %bound1187 = icmp ult double* %scevgep182, %scevgep180
  %memcheck.conflict189 = and i1 %bound0186, %bound1187
  br i1 %memcheck.conflict189, label %vector.memcheck190.scalar.ph171.preheader_crit_edge, label %vector.body169.preheader

vector.memcheck190.scalar.ph171.preheader_crit_edge: ; preds = %vector.memcheck190
  br label %scalar.ph171.preheader

vector.body169.preheader:                         ; preds = %vector.memcheck190
  br label %vector.body169

vector.body169:                                   ; preds = %vector.body169.vector.body169_crit_edge, %vector.body169.preheader
  %index192 = phi i64 [ %index.next193, %vector.body169.vector.body169_crit_edge ], [ 0, %vector.body169.preheader ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %91, i64 0, i64 %indvars.iv94, i64 %index192
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load200 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !16
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load201 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !16
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %indvars.iv94, i64 %index192
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load200, <2 x i64>* %102, align 8, !alias.scope !19, !noalias !16
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load201, <2 x i64>* %104, align 8, !alias.scope !19, !noalias !16
  %index.next193 = add i64 %index192, 4
  %105 = icmp eq i64 %index.next193, %n.vec175
  br i1 %105, label %middle.block170, label %vector.body169.vector.body169_crit_edge, !llvm.loop !21

vector.body169.vector.body169_crit_edge:          ; preds = %vector.body169
  br label %vector.body169

middle.block170:                                  ; preds = %vector.body169
  br i1 %cmp.n195, label %middle.block170.._crit_edge1.us_crit_edge, label %middle.block170.scalar.ph171.preheader_crit_edge

middle.block170.scalar.ph171.preheader_crit_edge: ; preds = %middle.block170
  br label %scalar.ph171.preheader

middle.block170.._crit_edge1.us_crit_edge:        ; preds = %middle.block170
  br label %._crit_edge1.us

scalar.ph171.preheader:                           ; preds = %middle.block170.scalar.ph171.preheader_crit_edge, %vector.memcheck190.scalar.ph171.preheader_crit_edge, %min.iters.checked173.scalar.ph171.preheader_crit_edge, %.preheader.us.scalar.ph171.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck190.scalar.ph171.preheader_crit_edge ], [ 0, %min.iters.checked173.scalar.ph171.preheader_crit_edge ], [ 0, %.preheader.us.scalar.ph171.preheader_crit_edge ], [ %n.vec175, %middle.block170.scalar.ph171.preheader_crit_edge ]
  br label %scalar.ph171

scalar.ph171:                                     ; preds = %scalar.ph171.scalar.ph171_crit_edge, %scalar.ph171.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph171.scalar.ph171_crit_edge ], [ %indvars.iv.ph, %scalar.ph171.preheader ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %91, i64 0, i64 %indvars.iv94, i64 %indvars.iv
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %indvars.iv94, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %exitcond93 = icmp eq i64 %indvars.iv, %wide.trip.count92
  br i1 %exitcond93, label %._crit_edge1.us.loopexit, label %scalar.ph171.scalar.ph171_crit_edge, !llvm.loop !22

scalar.ph171.scalar.ph171_crit_edge:              ; preds = %scalar.ph171
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph171

._crit_edge1.us.loopexit:                         ; preds = %scalar.ph171
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %middle.block170.._crit_edge1.us_crit_edge, %._crit_edge1.us.loopexit
  %indvars.iv.next95 = add i64 %indvars.iv94, 1
  %111 = icmp slt i64 %indvars.iv.next95, %95
  br i1 %111, label %._crit_edge1.us..preheader.us_crit_edge, label %._crit_edge1.preheader._crit_edge.loopexit

._crit_edge1.us..preheader.us_crit_edge:          ; preds = %._crit_edge1.us
  br label %.preheader.us

._crit_edge1.preheader._crit_edge.loopexit:       ; preds = %._crit_edge1.us
  br label %._crit_edge1.preheader._crit_edge

._crit_edge1.preheader._crit_edge:                ; preds = %._crit_edge1.preheader._crit_edge.loopexit, %._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge
  %112 = phi i8* [ %.pre, %._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge ], [ %93, %._crit_edge1.preheader._crit_edge.loopexit ]
  tail call void @free(i8* %112) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader9.lr.ph, label %.._crit_edge74_crit_edge

.._crit_edge74_crit_edge:                         ; preds = %5
  br label %._crit_edge74

.preheader9.lr.ph:                                ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count118 = sext i32 %7 to i64
  br label %.preheader9

.preheader9:                                      ; preds = %._crit_edge53..preheader9_crit_edge, %.preheader9.lr.ph
  %indvars.iv135 = phi i64 [ 0, %.preheader9.lr.ph ], [ %indvars.iv.next136, %._crit_edge53..preheader9_crit_edge ]
  %indvars.iv127 = phi i32 [ -1, %.preheader9.lr.ph ], [ %9, %._crit_edge53..preheader9_crit_edge ]
  %9 = add i32 %indvars.iv127, 1
  %10 = icmp sgt i64 %indvars.iv135, 0
  br i1 %10, label %.lr.ph39.preheader, label %.preheader9.._crit_edge40_crit_edge

.preheader9.._crit_edge40_crit_edge:              ; preds = %.preheader9
  br label %._crit_edge40

.lr.ph39.preheader:                               ; preds = %.preheader9
  br label %.lr.ph39

..preheader_crit_edge:                            ; preds = %._crit_edge53
  br i1 true, label %.lr.ph27, label %..preheader_crit_edge.._crit_edge74_crit_edge

..preheader_crit_edge.._crit_edge74_crit_edge:    ; preds = %..preheader_crit_edge
  br label %._crit_edge74

.lr.ph27:                                         ; preds = %..preheader_crit_edge
  br label %41

.lr.ph39:                                         ; preds = %._crit_edge67..lr.ph39_crit_edge, %.lr.ph39.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge67..lr.ph39_crit_edge ], [ 0, %.lr.ph39.preheader ]
  %indvars.iv108 = phi i32 [ %11, %._crit_edge67..lr.ph39_crit_edge ], [ -1, %.lr.ph39.preheader ]
  %11 = add i32 %indvars.iv108, 1
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv112
  %13 = load double, double* %12, align 8
  %14 = icmp sgt i64 %indvars.iv112, 0
  br i1 %14, label %.lr.ph34, label %.lr.ph39.._crit_edge67_crit_edge

.lr.ph39.._crit_edge67_crit_edge:                 ; preds = %.lr.ph39
  br label %._crit_edge67

.lr.ph34:                                         ; preds = %.lr.ph39
  %wide.trip.count110 = zext i32 %indvars.iv108 to i64
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %.lr.ph34
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge ], [ 0, %.lr.ph34 ]
  %16 = phi double [ %22, %._crit_edge ], [ %13, %.lr.ph34 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv102
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv112
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  %exitcond111 = icmp eq i64 %indvars.iv102, %wide.trip.count110
  br i1 %exitcond111, label %._crit_edge67.loopexit, label %._crit_edge

._crit_edge:                                      ; preds = %15
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  br label %15

._crit_edge67.loopexit:                           ; preds = %15
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %.lr.ph39.._crit_edge67_crit_edge, %._crit_edge67.loopexit
  %23 = phi double [ %13, %.lr.ph39.._crit_edge67_crit_edge ], [ %22, %._crit_edge67.loopexit ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv112
  %25 = load double, double* %24, align 8
  %26 = fdiv double %23, %25
  store double %26, double* %12, align 8
  %indvars.iv.next113 = add nuw i64 %indvars.iv112, 1
  %27 = icmp slt i64 %indvars.iv.next113, %indvars.iv135
  br i1 %27, label %._crit_edge67..lr.ph39_crit_edge, label %._crit_edge40.loopexit

._crit_edge67..lr.ph39_crit_edge:                 ; preds = %._crit_edge67
  br label %.lr.ph39

._crit_edge40.loopexit:                           ; preds = %._crit_edge67
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %.preheader9.._crit_edge40_crit_edge, %._crit_edge40.loopexit
  %28 = icmp slt i64 %indvars.iv135, %8
  br i1 %28, label %.lr.ph52, label %._crit_edge40.._crit_edge53_crit_edge

._crit_edge40.._crit_edge53_crit_edge:            ; preds = %._crit_edge40
  br label %._crit_edge53

.lr.ph52:                                         ; preds = %._crit_edge40
  br i1 %10, label %.lr.ph52.split.us.preheader, label %.lr.ph52.split.preheader

.lr.ph52.split.preheader:                         ; preds = %.lr.ph52
  br label %.lr.ph52.split

.lr.ph52.split.us.preheader:                      ; preds = %.lr.ph52
  %wide.trip.count129 = zext i32 %indvars.iv127 to i64
  br label %.lr.ph52.split.us

.lr.ph52.split.us:                                ; preds = %._crit_edge46.us..lr.ph52.split.us_crit_edge, %.lr.ph52.split.us.preheader
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge46.us..lr.ph52.split.us_crit_edge ], [ %indvars.iv135, %.lr.ph52.split.us.preheader ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv133
  %30 = load double, double* %29, align 8
  br label %31

; <label>:31:                                     ; preds = %._crit_edge150, %.lr.ph52.split.us
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge150 ], [ 0, %.lr.ph52.split.us ]
  %32 = phi double [ %38, %._crit_edge150 ], [ %30, %.lr.ph52.split.us ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv121
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv133
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  %exitcond130 = icmp eq i64 %indvars.iv121, %wide.trip.count129
  br i1 %exitcond130, label %._crit_edge46.us, label %._crit_edge150

._crit_edge150:                                   ; preds = %31
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  br label %31

._crit_edge46.us:                                 ; preds = %31
  store double %38, double* %29, align 8
  %indvars.iv.next134 = add i64 %indvars.iv133, 1
  %39 = icmp slt i64 %indvars.iv.next134, %8
  br i1 %39, label %._crit_edge46.us..lr.ph52.split.us_crit_edge, label %._crit_edge53.loopexit

._crit_edge46.us..lr.ph52.split.us_crit_edge:     ; preds = %._crit_edge46.us
  br label %.lr.ph52.split.us

.lr.ph52.split:                                   ; preds = %.lr.ph52.split..lr.ph52.split_crit_edge, %.lr.ph52.split.preheader
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %.lr.ph52.split..lr.ph52.split_crit_edge ], [ %indvars.iv135, %.lr.ph52.split.preheader ]
  %exitcond119 = icmp eq i64 %indvars.iv116, %wide.trip.count118
  br i1 %exitcond119, label %._crit_edge53.loopexit149, label %.lr.ph52.split..lr.ph52.split_crit_edge

.lr.ph52.split..lr.ph52.split_crit_edge:          ; preds = %.lr.ph52.split
  %indvars.iv.next117 = add i64 %indvars.iv116, 1
  br label %.lr.ph52.split

._crit_edge53.loopexit:                           ; preds = %._crit_edge46.us
  br label %._crit_edge53

._crit_edge53.loopexit149:                        ; preds = %.lr.ph52.split
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge40.._crit_edge53_crit_edge, %._crit_edge53.loopexit149, %._crit_edge53.loopexit
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %40 = icmp slt i64 %indvars.iv.next136, %8
  br i1 %40, label %._crit_edge53..preheader9_crit_edge, label %..preheader_crit_edge

._crit_edge53..preheader9_crit_edge:              ; preds = %._crit_edge53
  br label %.preheader9

; <label>:41:                                     ; preds = %._crit_edge71._crit_edge, %.lr.ph27
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge71._crit_edge ], [ 0, %.lr.ph27 ]
  %indvars.iv96 = phi i32 [ %indvars.iv.next97, %._crit_edge71._crit_edge ], [ -1, %.lr.ph27 ]
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv100
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = icmp sgt i64 %indvars.iv100, 0
  br i1 %45, label %.lr.ph22, label %.._crit_edge71_crit_edge

.._crit_edge71_crit_edge:                         ; preds = %41
  br label %._crit_edge71

.lr.ph22:                                         ; preds = %41
  %46 = bitcast i64 %44 to double
  %wide.trip.count98 = zext i32 %indvars.iv96 to i64
  br label %47

; <label>:47:                                     ; preds = %._crit_edge151, %.lr.ph22
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge151 ], [ 0, %.lr.ph22 ]
  %48 = phi double [ %54, %._crit_edge151 ], [ %46, %.lr.ph22 ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv90
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  %exitcond99 = icmp eq i64 %indvars.iv90, %wide.trip.count98
  br i1 %exitcond99, label %._crit_edge23, label %._crit_edge151

._crit_edge151:                                   ; preds = %47
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  br label %47

._crit_edge23:                                    ; preds = %47
  %55 = bitcast double %54 to i64
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %.._crit_edge71_crit_edge, %._crit_edge23
  %56 = phi i64 [ %44, %.._crit_edge71_crit_edge ], [ %55, %._crit_edge23 ]
  %57 = getelementptr inbounds double, double* %4, i64 %indvars.iv100
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next101 = add i64 %indvars.iv100, 1
  %59 = icmp slt i64 %indvars.iv.next101, %8
  br i1 %59, label %._crit_edge71._crit_edge, label %.preheader._crit_edge

._crit_edge71._crit_edge:                         ; preds = %._crit_edge71
  %indvars.iv.next97 = add i32 %indvars.iv96, 1
  br label %41

.preheader._crit_edge:                            ; preds = %._crit_edge71
  br label %60

; <label>:60:                                     ; preds = %._crit_edge77, %.preheader._crit_edge
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge77 ], [ %wide.trip.count118, %.preheader._crit_edge ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge77 ], [ %0, %.preheader._crit_edge ]
  %61 = getelementptr inbounds double, double* %4, i64 %indvars.iv87
  %62 = load double, double* %61, align 8
  %63 = add nsw i64 %indvars.iv87, 1
  %64 = icmp slt i64 %63, %8
  br i1 %64, label %.lr.ph, label %.._crit_edge75_crit_edge

.._crit_edge75_crit_edge:                         ; preds = %60
  br label %._crit_edge75

.lr.ph:                                           ; preds = %60
  %65 = sext i32 %indvars.iv to i64
  br label %66

; <label>:66:                                     ; preds = %._crit_edge152, %.lr.ph
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge152 ], [ %65, %.lr.ph ]
  %67 = phi double [ %73, %._crit_edge152 ], [ %62, %.lr.ph ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv85
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv85
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %67, %72
  %exitcond = icmp eq i64 %indvars.iv85, %wide.trip.count118
  br i1 %exitcond, label %._crit_edge75.loopexit, label %._crit_edge152

._crit_edge152:                                   ; preds = %66
  %indvars.iv.next86 = add nsw i64 %indvars.iv85, 1
  br label %66

._crit_edge75.loopexit:                           ; preds = %66
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %.._crit_edge75_crit_edge, %._crit_edge75.loopexit
  %74 = phi double [ %62, %.._crit_edge75_crit_edge ], [ %73, %._crit_edge75.loopexit ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv87
  %76 = load double, double* %75, align 8
  %77 = fdiv double %74, %76
  %78 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  store double %77, double* %78, align 8
  %79 = icmp sgt i64 %indvars.iv87, 0
  br i1 %79, label %._crit_edge77, label %._crit_edge74.loopexit

._crit_edge77:                                    ; preds = %._crit_edge75
  %indvars.iv.next88 = add i64 %indvars.iv87, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %60

._crit_edge74.loopexit:                           ; preds = %._crit_edge75
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %..preheader_crit_edge.._crit_edge74_crit_edge, %.._crit_edge74_crit_edge, %._crit_edge74.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %.._crit_edge1_crit_edge

.._crit_edge1_crit_edge:                          ; preds = %2
  br label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2.._crit_edge3_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2.._crit_edge3_crit_edge ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge3.._crit_edge2_crit_edge

._crit_edge3.._crit_edge2_crit_edge:              ; preds = %._crit_edge3
  br label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3.._crit_edge2_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge2.._crit_edge3_crit_edge, label %._crit_edge1.loopexit

._crit_edge2.._crit_edge3_crit_edge:              ; preds = %._crit_edge2
  br label %._crit_edge3

._crit_edge1.loopexit:                            ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %.._crit_edge1_crit_edge, %._crit_edge1.loopexit
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!10, !7}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !2, !3}
!22 = distinct !{!22, !2, !3}
