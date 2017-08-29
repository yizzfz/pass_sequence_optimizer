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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
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
  br i1 %9, label %.lr.ph57, label %._crit_edge68.thread

._crit_edge68.thread:                             ; preds = %5
  br label %._crit_edge70

.lr.ph57:                                         ; preds = %5
  %10 = sext i32 %0 to i64
  %xtraiter231 = and i64 %10, 1
  %lcmp.mod232 = icmp eq i64 %xtraiter231, 0
  br i1 %lcmp.mod232, label %._crit_edge69.prol.loopexit, label %._crit_edge69.prol.preheader

._crit_edge69.prol.preheader:                     ; preds = %.lr.ph57
  br label %._crit_edge69.prol

._crit_edge69.prol:                               ; preds = %._crit_edge69.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %11 = fdiv double 1.000000e+00, %8
  %12 = fmul double %11, 5.000000e-01
  %13 = fadd double %12, 4.000000e+00
  store double %13, double* %2, align 8
  br label %._crit_edge69.prol.loopexit

._crit_edge69.prol.loopexit:                      ; preds = %.lr.ph57, %._crit_edge69.prol
  %indvars.iv125.unr = phi i64 [ 0, %.lr.ph57 ], [ 1, %._crit_edge69.prol ]
  %14 = icmp eq i32 %0, 1
  br i1 %14, label %._crit_edge68, label %.lr.ph57.new

.lr.ph57.new:                                     ; preds = %._crit_edge69.prol.loopexit
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %.lr.ph57.new
  %indvars.iv125 = phi i64 [ %indvars.iv125.unr, %.lr.ph57.new ], [ %indvars.iv.next126.1, %._crit_edge69 ]
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv125
  %16 = bitcast double* %15 to <2 x double>*
  %17 = getelementptr inbounds double, double* %4, i64 %indvars.iv125
  %18 = bitcast double* %17 to <2 x double>*
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %19 = trunc i64 %indvars.iv.next126 to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv125
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %22 = trunc i64 %indvars.iv.next126.1 to i32
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %8, i32 0
  %25 = insertelement <2 x double> %24, double %8, i32 1
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %23, i32 1
  %28 = fdiv <2 x double> %27, %25
  %29 = fmul <2 x double> %28, <double 5.000000e-01, double 5.000000e-01>
  %30 = fadd <2 x double> %29, <double 4.000000e+00, double 4.000000e+00>
  %31 = bitcast double* %21 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %32 = icmp slt i64 %indvars.iv.next126.1, %10
  br i1 %32, label %._crit_edge69, label %._crit_edge68.unr-lcssa

._crit_edge68.unr-lcssa:                          ; preds = %._crit_edge69
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge69.prol.loopexit, %._crit_edge68.unr-lcssa
  %33 = add i32 %0, -1
  %wide.trip.count = sext i32 %33 to i64
  %34 = add nsw i64 %wide.trip.count, 1
  %35 = add nsw i64 %wide.trip.count, 1
  br label %._crit_edge46._crit_edge

._crit_edge46._crit_edge:                         ; preds = %._crit_edge46, %._crit_edge68
  %indvar144 = phi i32 [ %42, %._crit_edge46 ], [ 0, %._crit_edge68 ]
  %indvars.iv141 = phi i32 [ %indvars.iv.next142, %._crit_edge46 ], [ 0, %._crit_edge68 ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge46 ], [ 0, %._crit_edge68 ]
  %36 = add i32 %indvar144, 1
  %37 = sext i32 %36 to i64
  %38 = sub nsw i64 %35, %37
  %39 = add nsw i64 %38, -4
  %40 = lshr i64 %39, 2
  %41 = add nuw nsw i64 %40, 1
  %42 = add i32 %indvar144, 1
  %43 = sext i32 %42 to i64
  %44 = sub nsw i64 %34, %43
  %45 = zext i32 %indvars.iv141 to i64
  %indvars.iv.next142 = add i32 %indvars.iv141, 1
  %46 = sext i32 %indvars.iv.next142 to i64
  %47 = icmp sgt i64 %indvars.iv123, -1
  br i1 %47, label %.lr.ph40.preheader, label %._crit_edge41

.lr.ph40.preheader:                               ; preds = %._crit_edge46._crit_edge
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40.preheader, %.lr.ph40
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %.lr.ph40 ], [ 0, %.lr.ph40.preheader ]
  %48 = sub nsw i64 0, %indvars.iv111
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, %0
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %8
  %53 = fadd double %52, 1.000000e+00
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv111
  store double %53, double* %54, align 8
  %exitcond143 = icmp eq i64 %indvars.iv111, %45
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  br i1 %exitcond143, label %._crit_edge41.loopexit, label %.lr.ph40

._crit_edge41.loopexit:                           ; preds = %.lr.ph40
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %._crit_edge46._crit_edge
  %indvars.iv.next124 = add i64 %indvars.iv123, 1
  %55 = icmp slt i64 %indvars.iv.next124, %10
  br i1 %55, label %.lr.ph45.preheader, label %._crit_edge51.critedge

.lr.ph45.preheader:                               ; preds = %._crit_edge41
  %min.iters.check = icmp ult i64 %44, 4
  br i1 %min.iters.check, label %.lr.ph45.preheader218, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph45.preheader
  %n.vec = and i64 %44, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %46, %n.vec
  br i1 %cmp.zero, label %.lr.ph45.preheader218, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter228 = and i64 %41, 3
  %lcmp.mod229 = icmp eq i64 %xtraiter228, 0
  br i1 %lcmp.mod229, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter230 = phi i64 [ %prol.iter230.sub, %vector.body.prol ], [ %xtraiter228, %vector.body.prol.preheader ]
  %56 = add i64 %46, %index.prol
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %58, align 8
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %60, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter230.sub = add i64 %prol.iter230, -1
  %prol.iter230.cmp = icmp eq i64 %prol.iter230.sub, 0
  br i1 %prol.iter230.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %61 = icmp ult i64 %39, 12
  br i1 %61, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %62 = add i64 %46, %index
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %62
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %64, align 8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %66, align 8
  %index.next = add i64 %index, 4
  %67 = add i64 %46, %index.next
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %69, align 8
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %71, align 8
  %index.next.1 = add i64 %index, 8
  %72 = add i64 %46, %index.next.1
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %74, align 8
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %76, align 8
  %index.next.2 = add i64 %index, 12
  %77 = add i64 %46, %index.next.2
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %77
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %79, align 8
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %81, align 8
  %index.next.3 = add i64 %index, 16
  %82 = icmp eq i64 %index.next.3, %n.vec
  br i1 %82, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %44, %n.vec
  br i1 %cmp.n, label %._crit_edge46, label %.lr.ph45.preheader218

.lr.ph45.preheader218:                            ; preds = %middle.block, %min.iters.checked, %.lr.ph45.preheader
  %indvars.iv121.ph = phi i64 [ %46, %min.iters.checked ], [ %46, %.lr.ph45.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph45

.lr.ph45:                                         ; preds = %.lr.ph45.preheader218, %.lr.ph45
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %.lr.ph45 ], [ %indvars.iv121.ph, %.lr.ph45.preheader218 ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv121
  store double 0.000000e+00, double* %83, align 8
  %exitcond = icmp eq i64 %indvars.iv121, %wide.trip.count
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  br i1 %exitcond, label %._crit_edge46.loopexit, label %.lr.ph45, !llvm.loop !6

._crit_edge46.loopexit:                           ; preds = %.lr.ph45
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %middle.block
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %84, align 8
  br i1 true, label %._crit_edge46._crit_edge, label %._crit_edge51.loopexit

._crit_edge51.critedge:                           ; preds = %._crit_edge41
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %85, align 8
  br label %._crit_edge51

._crit_edge51.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %._crit_edge51.critedge
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge68.thread, %._crit_edge51
  %86 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %87 = bitcast [2000 x [2000 x double]]** %7 to i8**
  store i8* %86, i8** %87, align 8
  %88 = bitcast i8* %86 to [2000 x [2000 x double]]*
  %89 = bitcast i8* %86 to [2000 x [2000 x double]]*
  br i1 %9, label %.lr.ph33, label %._crit_edge74.thread

._crit_edge74.thread:                             ; preds = %._crit_edge70
  br label %._crit_edge1

.lr.ph33:                                         ; preds = %._crit_edge70
  %90 = sext i32 %0 to i64
  %91 = add i32 %0, -1
  %92 = zext i32 %91 to i64
  %93 = shl nuw nsw i64 %92, 3
  %94 = add nuw nsw i64 %93, 8
  %95 = add nsw i64 %90, -1
  %xtraiter225 = and i64 %90, 3
  %lcmp.mod226 = icmp eq i64 %xtraiter225, 0
  br i1 %lcmp.mod226, label %._crit_edge29.us.prol.loopexit, label %._crit_edge29.us.prol.preheader

._crit_edge29.us.prol.preheader:                  ; preds = %.lr.ph33
  br label %._crit_edge29.us.prol

._crit_edge29.us.prol:                            ; preds = %._crit_edge29.us.prol, %._crit_edge29.us.prol.preheader
  %indvars.iv108.prol = phi i64 [ %indvars.iv.next109.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %prol.iter227 = phi i64 [ %prol.iter227.sub, %._crit_edge29.us.prol ], [ %xtraiter225, %._crit_edge29.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvar.prol, i64 0
  %scevgep107.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.prol, i8 0, i64 %94, i32 8, i1 false)
  %indvars.iv.next109.prol = add nsw i64 %indvars.iv108.prol, 1
  %indvar.next.prol = add nuw nsw i64 %indvar.prol, 1
  %prol.iter227.sub = add i64 %prol.iter227, -1
  %prol.iter227.cmp = icmp eq i64 %prol.iter227.sub, 0
  br i1 %prol.iter227.cmp, label %._crit_edge29.us.prol.loopexit.unr-lcssa, label %._crit_edge29.us.prol, !llvm.loop !8

._crit_edge29.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge29.us.prol
  br label %._crit_edge29.us.prol.loopexit

._crit_edge29.us.prol.loopexit:                   ; preds = %.lr.ph33, %._crit_edge29.us.prol.loopexit.unr-lcssa
  %indvars.iv108.unr = phi i64 [ 0, %.lr.ph33 ], [ %indvars.iv.next109.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.lr.ph33 ], [ %indvar.next.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %96 = icmp ult i64 %95, 3
  br i1 %96, label %._crit_edge74.loopexit, label %.lr.ph33.new

.lr.ph33.new:                                     ; preds = %._crit_edge29.us.prol.loopexit
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us, %.lr.ph33.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr, %.lr.ph33.new ], [ %indvars.iv.next109.3, %._crit_edge29.us ]
  %indvar = phi i64 [ %indvar.unr, %.lr.ph33.new ], [ %indvar.next.3, %._crit_edge29.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvar, i64 0
  %scevgep107 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107, i8 0, i64 %94, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvar.next, i64 0
  %scevgep107.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.1, i8 0, i64 %94, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvar.next.1, i64 0
  %scevgep107.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.2, i8 0, i64 %94, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvar.next.2, i64 0
  %scevgep107.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.3, i8 0, i64 %94, i32 8, i1 false)
  %indvars.iv.next109.3 = add nsw i64 %indvars.iv108, 4
  %97 = icmp slt i64 %indvars.iv.next109.3, %90
  %indvar.next.3 = add nsw i64 %indvar, 4
  br i1 %97, label %._crit_edge29.us, label %._crit_edge74.loopexit.unr-lcssa

._crit_edge74.loopexit.unr-lcssa:                 ; preds = %._crit_edge29.us
  br label %._crit_edge74.loopexit

._crit_edge74.loopexit:                           ; preds = %._crit_edge29.us.prol.loopexit, %._crit_edge74.loopexit.unr-lcssa
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge74.loopexit.._crit_edge1_crit_edge

._crit_edge74.loopexit.._crit_edge1_crit_edge:    ; preds = %._crit_edge74.loopexit
  br label %._crit_edge1

._crit_edge.lr.ph:                                ; preds = %._crit_edge74.loopexit
  %98 = add nuw nsw i64 %92, 1
  %99 = add nuw nsw i64 %92, 1
  %min.iters.check150 = icmp ult i64 %98, 4
  %n.vec153 = and i64 %98, 8589934588
  %cmp.zero154 = icmp eq i64 %n.vec153, 0
  %cmp.n176 = icmp eq i64 %98, %n.vec153
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge16.us-lcssa.us.us, %._crit_edge.lr.ph
  %indvar162 = phi i64 [ %100, %._crit_edge16.us-lcssa.us.us ], [ 0, %._crit_edge.lr.ph ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge16.us-lcssa.us.us ], [ 0, %._crit_edge.lr.ph ]
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvar162
  %100 = add i64 %indvar162, 1
  %scevgep166 = getelementptr [2000 x double], [2000 x double]* %1, i64 %92, i64 %100
  br label %.lr.ph12.us.us

._crit_edge16.us-lcssa.us.us:                     ; preds = %._crit_edge13.us.us
  %indvars.iv.next104 = add nsw i64 %indvars.iv103, 1
  %101 = icmp slt i64 %indvars.iv.next104, %90
  br i1 %101, label %._crit_edge.us, label %._crit_edge16.us-lcssa.us.us..._crit_edge1_crit_edge_crit_edge

._crit_edge16.us-lcssa.us.us..._crit_edge1_crit_edge_crit_edge: ; preds = %._crit_edge16.us-lcssa.us.us
  br label %._crit_edge1

.lr.ph12.us.us:                                   ; preds = %._crit_edge13.us.us, %._crit_edge.us
  %indvar156 = phi i64 [ %indvar.next157, %._crit_edge13.us.us ], [ 0, %._crit_edge.us ]
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge13.us.us ], [ 0, %._crit_edge.us ]
  %scevgep158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvar156, i64 0
  %scevgep160 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvar156, i64 %98
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv103
  br i1 %min.iters.check150, label %scalar.ph149.preheader, label %min.iters.checked151

scalar.ph149.preheader:                           ; preds = %middle.block148, %vector.memcheck, %min.iters.checked151, %.lr.ph12.us.us
  %indvars.iv97.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked151 ], [ 0, %.lr.ph12.us.us ], [ %n.vec153, %middle.block148 ]
  %103 = sub nsw i64 %99, %indvars.iv97.ph
  %xtraiter223 = and i64 %103, 1
  %lcmp.mod224 = icmp eq i64 %xtraiter223, 0
  br i1 %lcmp.mod224, label %scalar.ph149.prol.loopexit.unr-lcssa, label %scalar.ph149.prol.preheader

scalar.ph149.prol.preheader:                      ; preds = %scalar.ph149.preheader
  br label %scalar.ph149.prol

scalar.ph149.prol:                                ; preds = %scalar.ph149.prol.preheader
  %104 = load double, double* %102, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97.ph, i64 %indvars.iv103
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv101, i64 %indvars.iv97.ph
  %109 = load double, double* %108, align 8
  %110 = fadd double %109, %107
  store double %110, double* %108, align 8
  %indvars.iv.next98.prol = or i64 %indvars.iv97.ph, 1
  br label %scalar.ph149.prol.loopexit.unr-lcssa

scalar.ph149.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph149.preheader, %scalar.ph149.prol
  %indvars.iv97.unr.ph = phi i64 [ %indvars.iv.next98.prol, %scalar.ph149.prol ], [ %indvars.iv97.ph, %scalar.ph149.preheader ]
  br label %scalar.ph149.prol.loopexit

scalar.ph149.prol.loopexit:                       ; preds = %scalar.ph149.prol.loopexit.unr-lcssa
  %111 = icmp eq i64 %92, %indvars.iv97.ph
  br i1 %111, label %._crit_edge13.us.us.loopexit, label %scalar.ph149.preheader.new

scalar.ph149.preheader.new:                       ; preds = %scalar.ph149.prol.loopexit
  br label %scalar.ph149

min.iters.checked151:                             ; preds = %.lr.ph12.us.us
  br i1 %cmp.zero154, label %scalar.ph149.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked151
  %bound0 = icmp ult double* %scevgep158, %scevgep166
  %bound1 = icmp ult double* %scevgep164, %scevgep160
  %found.conflict = and i1 %bound0, %bound1
  %bound0169 = icmp ult double* %scevgep158, %102
  %bound1170 = icmp ult double* %102, %scevgep160
  %found.conflict171 = and i1 %bound0169, %bound1170
  %conflict.rdx = or i1 %found.conflict, %found.conflict171
  br i1 %conflict.rdx, label %scalar.ph149.preheader, label %vector.body147.preheader

vector.body147.preheader:                         ; preds = %vector.memcheck
  br label %vector.body147

vector.body147:                                   ; preds = %vector.body147.preheader, %vector.body147
  %index173 = phi i64 [ %index.next174, %vector.body147 ], [ 0, %vector.body147.preheader ]
  %112 = or i64 %index173, 1
  %113 = or i64 %index173, 2
  %114 = or i64 %index173, 3
  %115 = load double, double* %102, align 8, !alias.scope !9
  %116 = insertelement <2 x double> undef, double %115, i32 0
  %117 = shufflevector <2 x double> %116, <2 x double> undef, <2 x i32> zeroinitializer
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index173, i64 %indvars.iv103
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %112, i64 %indvars.iv103
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %113, i64 %indvars.iv103
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %114, i64 %indvars.iv103
  %122 = load double, double* %118, align 8, !alias.scope !12
  %123 = load double, double* %119, align 8, !alias.scope !12
  %124 = load double, double* %120, align 8, !alias.scope !12
  %125 = load double, double* %121, align 8, !alias.scope !12
  %126 = insertelement <2 x double> undef, double %122, i32 0
  %127 = insertelement <2 x double> %126, double %123, i32 1
  %128 = insertelement <2 x double> undef, double %124, i32 0
  %129 = insertelement <2 x double> %128, double %125, i32 1
  %130 = fmul <2 x double> %117, %127
  %131 = fmul <2 x double> %117, %129
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv101, i64 %index173
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !14, !noalias !16
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load181 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !14, !noalias !16
  %136 = fadd <2 x double> %wide.load, %130
  %137 = fadd <2 x double> %wide.load181, %131
  store <2 x double> %136, <2 x double>* %133, align 8, !alias.scope !14, !noalias !16
  store <2 x double> %137, <2 x double>* %135, align 8, !alias.scope !14, !noalias !16
  %index.next174 = add i64 %index173, 4
  %138 = icmp eq i64 %index.next174, %n.vec153
  br i1 %138, label %middle.block148, label %vector.body147, !llvm.loop !17

middle.block148:                                  ; preds = %vector.body147
  br i1 %cmp.n176, label %._crit_edge13.us.us, label %scalar.ph149.preheader

._crit_edge13.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph149
  br label %._crit_edge13.us.us.loopexit

._crit_edge13.us.us.loopexit:                     ; preds = %scalar.ph149.prol.loopexit, %._crit_edge13.us.us.loopexit.unr-lcssa
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.loopexit, %middle.block148
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next102, %90
  %indvar.next157 = add i64 %indvar156, 1
  br i1 %exitcond138, label %._crit_edge16.us-lcssa.us.us, label %.lr.ph12.us.us

scalar.ph149:                                     ; preds = %scalar.ph149, %scalar.ph149.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph, %scalar.ph149.preheader.new ], [ %indvars.iv.next98.1, %scalar.ph149 ]
  %139 = load double, double* %102, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv103
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %144 = load double, double* %143, align 8
  %145 = fadd double %144, %142
  store double %145, double* %143, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %146 = load double, double* %102, align 8
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next98, i64 %indvars.iv103
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %151 = load double, double* %150, align 8
  %152 = fadd double %151, %149
  store double %152, double* %150, align 8
  %exitcond137.1 = icmp eq i64 %indvars.iv.next98, %92
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond137.1, label %._crit_edge13.us.us.loopexit.unr-lcssa, label %scalar.ph149, !llvm.loop !18

._crit_edge1:                                     ; preds = %._crit_edge74.loopexit.._crit_edge1_crit_edge, %._crit_edge74.thread, %._crit_edge16.us-lcssa.us.us..._crit_edge1_crit_edge_crit_edge
  br i1 %9, label %.lr.ph5, label %._crit_edge1.._crit_edge1._crit_edge_crit_edge

._crit_edge1.._crit_edge1._crit_edge_crit_edge:   ; preds = %._crit_edge1
  %.pre = load i8*, i8** %87, align 8
  br label %._crit_edge1._crit_edge

.lr.ph5:                                          ; preds = %._crit_edge1
  %153 = sext i32 %0 to i64
  %154 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %155 = load [2000 x double]*, [2000 x double]** %6, align 8
  %156 = bitcast [2000 x [2000 x double]]* %154 to i8*
  %157 = add i32 %0, -1
  %158 = zext i32 %157 to i64
  %159 = add nuw nsw i64 %158, 1
  %160 = and i64 %159, 8589934588
  %161 = add nsw i64 %160, -4
  %162 = lshr exact i64 %161, 2
  %163 = add nuw nsw i64 %158, 1
  %min.iters.check185 = icmp ult i64 %159, 4
  %n.vec188 = and i64 %159, 8589934588
  %cmp.zero189 = icmp eq i64 %n.vec188, 0
  %164 = and i64 %162, 1
  %lcmp.mod = icmp eq i64 %164, 0
  %165 = icmp eq i64 %162, 0
  %cmp.n210 = icmp eq i64 %159, %n.vec188
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph5
  %indvar191 = phi i64 [ %indvar.next192, %._crit_edge3.us ], [ 0, %.lr.ph5 ]
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge3.us ], [ 0, %.lr.ph5 ]
  %scevgep193 = getelementptr [2000 x double], [2000 x double]* %155, i64 %indvar191, i64 0
  %scevgep195 = getelementptr [2000 x double], [2000 x double]* %155, i64 %indvar191, i64 %159
  %scevgep197 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvar191, i64 0
  %scevgep199 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvar191, i64 %159
  br i1 %min.iters.check185, label %scalar.ph184.preheader, label %min.iters.checked186

min.iters.checked186:                             ; preds = %.lr.ph5.split.us
  br i1 %cmp.zero189, label %scalar.ph184.preheader, label %vector.memcheck205

vector.memcheck205:                               ; preds = %min.iters.checked186
  %bound0201 = icmp ult double* %scevgep193, %scevgep199
  %bound1202 = icmp ult double* %scevgep197, %scevgep195
  %memcheck.conflict204 = and i1 %bound0201, %bound1202
  br i1 %memcheck.conflict204, label %scalar.ph184.preheader, label %vector.body182.preheader

vector.body182.preheader:                         ; preds = %vector.memcheck205
  br i1 %lcmp.mod, label %vector.body182.prol.preheader, label %vector.body182.prol.loopexit.unr-lcssa

vector.body182.prol.preheader:                    ; preds = %vector.body182.preheader
  br label %vector.body182.prol

vector.body182.prol:                              ; preds = %vector.body182.prol.preheader
  %166 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 0
  %167 = bitcast double* %166 to <2 x i64>*
  %wide.load215.prol = load <2 x i64>, <2 x i64>* %167, align 8, !alias.scope !19
  %168 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 2
  %169 = bitcast double* %168 to <2 x i64>*
  %wide.load216.prol = load <2 x i64>, <2 x i64>* %169, align 8, !alias.scope !19
  %170 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 0
  %171 = bitcast double* %170 to <2 x i64>*
  store <2 x i64> %wide.load215.prol, <2 x i64>* %171, align 8, !alias.scope !22, !noalias !19
  %172 = getelementptr [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 2
  %173 = bitcast double* %172 to <2 x i64>*
  store <2 x i64> %wide.load216.prol, <2 x i64>* %173, align 8, !alias.scope !22, !noalias !19
  br label %vector.body182.prol.loopexit.unr-lcssa

vector.body182.prol.loopexit.unr-lcssa:           ; preds = %vector.body182.preheader, %vector.body182.prol
  %index207.unr.ph = phi i64 [ 4, %vector.body182.prol ], [ 0, %vector.body182.preheader ]
  br label %vector.body182.prol.loopexit

vector.body182.prol.loopexit:                     ; preds = %vector.body182.prol.loopexit.unr-lcssa
  br i1 %165, label %middle.block183, label %vector.body182.preheader.new

vector.body182.preheader.new:                     ; preds = %vector.body182.prol.loopexit
  br label %vector.body182

vector.body182:                                   ; preds = %vector.body182, %vector.body182.preheader.new
  %index207 = phi i64 [ %index207.unr.ph, %vector.body182.preheader.new ], [ %index.next208.1, %vector.body182 ]
  %174 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 %index207
  %175 = bitcast double* %174 to <2 x i64>*
  %wide.load215 = load <2 x i64>, <2 x i64>* %175, align 8, !alias.scope !19
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x i64>*
  %wide.load216 = load <2 x i64>, <2 x i64>* %177, align 8, !alias.scope !19
  %178 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 %index207
  %179 = bitcast double* %178 to <2 x i64>*
  store <2 x i64> %wide.load215, <2 x i64>* %179, align 8, !alias.scope !22, !noalias !19
  %180 = getelementptr double, double* %178, i64 2
  %181 = bitcast double* %180 to <2 x i64>*
  store <2 x i64> %wide.load216, <2 x i64>* %181, align 8, !alias.scope !22, !noalias !19
  %index.next208 = add i64 %index207, 4
  %182 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 %index.next208
  %183 = bitcast double* %182 to <2 x i64>*
  %wide.load215.1 = load <2 x i64>, <2 x i64>* %183, align 8, !alias.scope !19
  %184 = getelementptr double, double* %182, i64 2
  %185 = bitcast double* %184 to <2 x i64>*
  %wide.load216.1 = load <2 x i64>, <2 x i64>* %185, align 8, !alias.scope !19
  %186 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 %index.next208
  %187 = bitcast double* %186 to <2 x i64>*
  store <2 x i64> %wide.load215.1, <2 x i64>* %187, align 8, !alias.scope !22, !noalias !19
  %188 = getelementptr double, double* %186, i64 2
  %189 = bitcast double* %188 to <2 x i64>*
  store <2 x i64> %wide.load216.1, <2 x i64>* %189, align 8, !alias.scope !22, !noalias !19
  %index.next208.1 = add i64 %index207, 8
  %190 = icmp eq i64 %index.next208.1, %n.vec188
  br i1 %190, label %middle.block183.unr-lcssa, label %vector.body182, !llvm.loop !24

middle.block183.unr-lcssa:                        ; preds = %vector.body182
  br label %middle.block183

middle.block183:                                  ; preds = %vector.body182.prol.loopexit, %middle.block183.unr-lcssa
  br i1 %cmp.n210, label %._crit_edge3.us, label %scalar.ph184.preheader

scalar.ph184.preheader:                           ; preds = %middle.block183, %vector.memcheck205, %min.iters.checked186, %.lr.ph5.split.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck205 ], [ 0, %min.iters.checked186 ], [ 0, %.lr.ph5.split.us ], [ %n.vec188, %middle.block183 ]
  %191 = sub nsw i64 %163, %indvars.iv.ph
  %192 = sub nsw i64 %158, %indvars.iv.ph
  %xtraiter221 = and i64 %191, 3
  %lcmp.mod222 = icmp eq i64 %xtraiter221, 0
  br i1 %lcmp.mod222, label %scalar.ph184.prol.loopexit, label %scalar.ph184.prol.preheader

scalar.ph184.prol.preheader:                      ; preds = %scalar.ph184.preheader
  br label %scalar.ph184.prol

scalar.ph184.prol:                                ; preds = %scalar.ph184.prol, %scalar.ph184.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph184.prol ], [ %indvars.iv.ph, %scalar.ph184.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph184.prol ], [ %xtraiter221, %scalar.ph184.prol.preheader ]
  %193 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %194 = bitcast double* %193 to i64*
  %195 = load i64, i64* %194, align 8
  %196 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 %indvars.iv.prol
  %197 = bitcast double* %196 to i64*
  store i64 %195, i64* %197, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph184.prol.loopexit.unr-lcssa, label %scalar.ph184.prol, !llvm.loop !25

scalar.ph184.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph184.prol
  br label %scalar.ph184.prol.loopexit

scalar.ph184.prol.loopexit:                       ; preds = %scalar.ph184.preheader, %scalar.ph184.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph184.preheader ], [ %indvars.iv.next.prol, %scalar.ph184.prol.loopexit.unr-lcssa ]
  %198 = icmp ult i64 %192, 3
  br i1 %198, label %._crit_edge3.us.loopexit, label %scalar.ph184.preheader.new

scalar.ph184.preheader.new:                       ; preds = %scalar.ph184.prol.loopexit
  br label %scalar.ph184

scalar.ph184:                                     ; preds = %scalar.ph184, %scalar.ph184.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph184.preheader.new ], [ %indvars.iv.next.3, %scalar.ph184 ]
  %199 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %200 = bitcast double* %199 to i64*
  %201 = load i64, i64* %200, align 8
  %202 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 %indvars.iv
  %203 = bitcast double* %202 to i64*
  store i64 %201, i64* %203, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %204 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %205 = bitcast double* %204 to i64*
  %206 = load i64, i64* %205, align 8
  %207 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 %indvars.iv.next
  %208 = bitcast double* %207 to i64*
  store i64 %206, i64* %208, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %209 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %210 = bitcast double* %209 to i64*
  %211 = load i64, i64* %210, align 8
  %212 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %213 = bitcast double* %212 to i64*
  store i64 %211, i64* %213, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %214 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %154, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %215 = bitcast double* %214 to i64*
  %216 = load i64, i64* %215, align 8
  %217 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %218 = bitcast double* %217 to i64*
  store i64 %216, i64* %218, align 8
  %exitcond135.3 = icmp eq i64 %indvars.iv.next.2, %158
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond135.3, label %._crit_edge3.us.loopexit.unr-lcssa, label %scalar.ph184, !llvm.loop !26

._crit_edge3.us.loopexit.unr-lcssa:               ; preds = %scalar.ph184
  br label %._crit_edge3.us.loopexit

._crit_edge3.us.loopexit:                         ; preds = %scalar.ph184.prol.loopexit, %._crit_edge3.us.loopexit.unr-lcssa
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit, %middle.block183
  %indvars.iv.next96 = add nsw i64 %indvars.iv95, 1
  %219 = icmp slt i64 %indvars.iv.next96, %153
  %indvar.next192 = add i64 %indvar191, 1
  br i1 %219, label %.lr.ph5.split.us, label %._crit_edge3.us.._crit_edge6_crit_edge

._crit_edge3.us.._crit_edge6_crit_edge:           ; preds = %._crit_edge3.us
  br label %._crit_edge1._crit_edge

._crit_edge1._crit_edge:                          ; preds = %._crit_edge1.._crit_edge1._crit_edge_crit_edge, %._crit_edge3.us.._crit_edge6_crit_edge
  %220 = phi i8* [ %.pre, %._crit_edge1.._crit_edge1._crit_edge_crit_edge ], [ %156, %._crit_edge3.us.._crit_edge6_crit_edge ]
  tail call void @free(i8* %220) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph56, label %._crit_edge73.thread.critedge

.lr.ph56:                                         ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %9 = sext i32 %7 to i64
  %10 = add nsw i64 %9, 1
  br label %11

; <label>:11:                                     ; preds = %._crit_edge48, %.lr.ph56
  %indvars.iv148 = phi i32 [ %17, %._crit_edge48 ], [ -1, %.lr.ph56 ]
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge48 ], [ 0, %.lr.ph56 ]
  %12 = add i64 %indvars.iv137, 4294967295
  %13 = and i64 %12, 4294967295
  %14 = sub i64 %10, %indvars.iv137
  %15 = sub i64 %9, %indvars.iv137
  %16 = zext i32 %indvars.iv148 to i64
  %17 = add i32 %indvars.iv148, 1
  %18 = icmp sgt i64 %indvars.iv137, 0
  br i1 %18, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %11
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %._crit_edge27
  %indvars.iv145 = phi i32 [ %23, %._crit_edge27 ], [ -1, %.lr.ph32.preheader ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge27 ], [ 0, %.lr.ph32.preheader ]
  %20 = add i64 %indvars.iv114, 4294967295
  %21 = and i64 %20, 4294967295
  %22 = zext i32 %indvars.iv145 to i64
  %23 = add i32 %indvars.iv145, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv114
  %25 = load double, double* %24, align 8
  %26 = icmp sgt i64 %indvars.iv114, 0
  br i1 %26, label %.lr.ph26.preheader, label %._crit_edge27

.lr.ph26.preheader:                               ; preds = %.lr.ph32
  %27 = and i64 %20, 1
  %lcmp.mod166 = icmp eq i64 %27, 0
  br i1 %lcmp.mod166, label %.lr.ph26.prol.preheader, label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.preheader:                          ; preds = %.lr.ph26.preheader
  br label %.lr.ph26.prol

.lr.ph26.prol:                                    ; preds = %.lr.ph26.prol.preheader
  %28 = load double, double* %19, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %25, %31
  br label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph26.preheader, %.lr.ph26.prol
  %.lcssa159.unr.ph = phi double [ %32, %.lr.ph26.prol ], [ undef, %.lr.ph26.preheader ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph26.prol ], [ 0, %.lr.ph26.preheader ]
  %.unr167.ph = phi double [ %32, %.lr.ph26.prol ], [ %25, %.lr.ph26.preheader ]
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol.loopexit.unr-lcssa
  %33 = icmp eq i64 %21, 0
  br i1 %33, label %._crit_edge27.loopexit, label %.lr.ph26.preheader.new

.lr.ph26.preheader.new:                           ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %.lr.ph26.preheader.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph26.preheader.new ], [ %indvars.iv.next105.1, %.lr.ph26 ]
  %34 = phi double [ %.unr167.ph, %.lr.ph26.preheader.new ], [ %48, %.lr.ph26 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv104
  %36 = bitcast double* %35 to <2 x double>*
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv114
  %38 = load double, double* %37, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %39 = load <2 x double>, <2 x double>* %36, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv114
  %41 = load double, double* %40, align 8
  %42 = insertelement <2 x double> undef, double %38, i32 0
  %43 = insertelement <2 x double> %42, double %41, i32 1
  %44 = fmul <2 x double> %39, %43
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %47 = fsub double %34, %45
  %48 = fsub double %47, %46
  %exitcond147.1 = icmp eq i64 %indvars.iv.next105, %22
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond147.1, label %._crit_edge27.loopexit.unr-lcssa, label %.lr.ph26

._crit_edge27.loopexit.unr-lcssa:                 ; preds = %.lr.ph26
  br label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %.lr.ph26.prol.loopexit, %._crit_edge27.loopexit.unr-lcssa
  %.lcssa159 = phi double [ %.lcssa159.unr.ph, %.lr.ph26.prol.loopexit ], [ %48, %._crit_edge27.loopexit.unr-lcssa ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.lr.ph32
  %.lcssa3038 = phi double [ %25, %.lr.ph32 ], [ %.lcssa159, %._crit_edge27.loopexit ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %50 = load double, double* %49, align 8
  %51 = fdiv double %.lcssa3038, %50
  store double %51, double* %24, align 8
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %52 = icmp slt i64 %indvars.iv.next115, %indvars.iv137
  br i1 %52, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge27
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %11
  %53 = icmp slt i64 %indvars.iv137, %8
  br i1 %53, label %.lr.ph47, label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge33
  br i1 %18, label %.lr.ph47.split.us.preheader, label %.lr.ph47.split.preheader

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter168 = and i64 %14, 7
  %lcmp.mod169 = icmp eq i64 %xtraiter168, 0
  br i1 %lcmp.mod169, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol.preheader

.lr.ph47.split.prol.preheader:                    ; preds = %.lr.ph47.split.preheader
  br label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.prol, %.lr.ph47.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph47.split.prol ], [ %indvars.iv137, %.lr.ph47.split.prol.preheader ]
  %prol.iter170 = phi i64 [ %prol.iter170.sub, %.lr.ph47.split.prol ], [ %xtraiter168, %.lr.ph47.split.prol.preheader ]
  %indvars.iv.next119.prol = add i64 %indvars.iv118.prol, 1
  %prol.iter170.sub = add i64 %prol.iter170, -1
  %prol.iter170.cmp = icmp eq i64 %prol.iter170.sub, 0
  br i1 %prol.iter170.cmp, label %.lr.ph47.split.prol.loopexit.unr-lcssa, label %.lr.ph47.split.prol, !llvm.loop !27

.lr.ph47.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph47.split.prol
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv137, %.lr.ph47.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph47.split.prol.loopexit.unr-lcssa ]
  %54 = icmp ult i64 %15, 7
  br i1 %54, label %.lr.ph47.split.._crit_edge48_crit_edge, label %.lr.ph47.split.preheader.new

.lr.ph47.split.preheader.new:                     ; preds = %.lr.ph47.split.prol.loopexit
  br label %.lr.ph47.split

.lr.ph47.split.us.preheader:                      ; preds = %.lr.ph47
  %55 = and i64 %12, 1
  %lcmp.mod174 = icmp eq i64 %55, 0
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  %57 = icmp eq i64 %13, 0
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %.lr.ph47.split.us.preheader, %._crit_edge41.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge41.us ], [ %indvars.iv137, %.lr.ph47.split.us.preheader ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %59 = load double, double* %58, align 8
  br i1 %lcmp.mod174, label %.prol.preheader171, label %.prol.loopexit172.unr-lcssa

.prol.preheader171:                               ; preds = %.lr.ph47.split.us
  br label %60

; <label>:60:                                     ; preds = %.prol.preheader171
  %61 = load double, double* %56, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %59, %64
  br label %.prol.loopexit172.unr-lcssa

.prol.loopexit172.unr-lcssa:                      ; preds = %.lr.ph47.split.us, %60
  %.lcssa160.unr.ph = phi double [ %65, %60 ], [ undef, %.lr.ph47.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %60 ], [ 0, %.lr.ph47.split.us ]
  %.unr175.ph = phi double [ %65, %60 ], [ %59, %.lr.ph47.split.us ]
  br label %.prol.loopexit172

.prol.loopexit172:                                ; preds = %.prol.loopexit172.unr-lcssa
  br i1 %57, label %._crit_edge41.us, label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.prol.loopexit172
  br label %66

; <label>:66:                                     ; preds = %66, %.lr.ph47.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph47.split.us.new ], [ %indvars.iv.next124.1, %66 ]
  %67 = phi double [ %.unr175.ph, %.lr.ph47.split.us.new ], [ %81, %66 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv123
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %71 = load double, double* %70, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %72, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %67, %78
  %81 = fsub double %80, %79
  %exitcond150.1 = icmp eq i64 %indvars.iv.next124, %16
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond150.1, label %._crit_edge41.us.unr-lcssa, label %66

._crit_edge41.us.unr-lcssa:                       ; preds = %66
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %.prol.loopexit172, %._crit_edge41.us.unr-lcssa
  %.lcssa160 = phi double [ %.lcssa160.unr.ph, %.prol.loopexit172 ], [ %81, %._crit_edge41.us.unr-lcssa ]
  store double %.lcssa160, double* %58, align 8
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next136, %8
  br i1 %exitcond151, label %._crit_edge48.loopexit, label %.lr.ph47.split.us

.lr.ph47.split:                                   ; preds = %.lr.ph47.split, %.lr.ph47.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph47.split.preheader.new ], [ %indvars.iv.next119.7, %.lr.ph47.split ]
  %indvars.iv.next119.6 = add i64 %indvars.iv118, 7
  %exitcond121.7 = icmp eq i64 %indvars.iv.next119.6, %9
  %indvars.iv.next119.7 = add i64 %indvars.iv118, 8
  br i1 %exitcond121.7, label %.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa, label %.lr.ph47.split

.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa: ; preds = %.lr.ph47.split
  br label %.lr.ph47.split.._crit_edge48_crit_edge

.lr.ph47.split.._crit_edge48_crit_edge:           ; preds = %.lr.ph47.split.prol.loopexit, %.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa
  br label %._crit_edge48

._crit_edge48.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %._crit_edge33, %.lr.ph47.split.._crit_edge48_crit_edge
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %82 = icmp slt i64 %indvars.iv.next138, %8
  br i1 %82, label %11, label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge48
  br i1 true, label %.lr.ph18, label %._crit_edge57.._crit_edge73.thread_crit_edge

._crit_edge57.._crit_edge73.thread_crit_edge:     ; preds = %._crit_edge57
  br label %._crit_edge73.thread

._crit_edge73.thread.critedge:                    ; preds = %5
  br label %._crit_edge73.thread

._crit_edge73.thread:                             ; preds = %._crit_edge57.._crit_edge73.thread_crit_edge, %._crit_edge73.thread.critedge
  br label %._crit_edge76

.lr.ph18:                                         ; preds = %._crit_edge57
  br label %83

; <label>:83:                                     ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv142 = phi i32 [ %indvars.iv.next143, %._crit_edge13 ], [ -1, %.lr.ph18 ]
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %84 = add i64 %indvars.iv102, 4294967295
  %85 = and i64 %84, 4294967295
  %86 = zext i32 %indvars.iv142 to i64
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %88 = load double, double* %87, align 8
  %89 = icmp sgt i64 %indvars.iv102, 0
  br i1 %89, label %.lr.ph12.preheader, label %._crit_edge13

.lr.ph12.preheader:                               ; preds = %83
  %xtraiter161 = and i64 %indvars.iv102, 3
  %lcmp.mod162 = icmp eq i64 %xtraiter161, 0
  br i1 %lcmp.mod162, label %.lr.ph12.prol.loopexit, label %.lr.ph12.prol.preheader

.lr.ph12.prol.preheader:                          ; preds = %.lr.ph12.preheader
  br label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.prol, %.lr.ph12.prol.preheader
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %.lr.ph12.prol ], [ 0, %.lr.ph12.prol.preheader ]
  %90 = phi double [ %96, %.lr.ph12.prol ], [ %88, %.lr.ph12.prol.preheader ]
  %prol.iter163 = phi i64 [ %prol.iter163.sub, %.lr.ph12.prol ], [ %xtraiter161, %.lr.ph12.prol.preheader ]
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %90, %95
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter163.sub = add i64 %prol.iter163, -1
  %prol.iter163.cmp = icmp eq i64 %prol.iter163.sub, 0
  br i1 %prol.iter163.cmp, label %.lr.ph12.prol.loopexit.unr-lcssa, label %.lr.ph12.prol, !llvm.loop !28

.lr.ph12.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph12.prol
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.preheader, %.lr.ph12.prol.loopexit.unr-lcssa
  %.lcssa158.unr = phi double [ undef, %.lr.ph12.preheader ], [ %96, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph12.preheader ], [ %indvars.iv.next93.prol, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %.unr164 = phi double [ %88, %.lr.ph12.preheader ], [ %96, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %97 = icmp ult i64 %85, 3
  br i1 %97, label %._crit_edge13.loopexit, label %.lr.ph12.preheader.new

.lr.ph12.preheader.new:                           ; preds = %.lr.ph12.prol.loopexit
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12, %.lr.ph12.preheader.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph12.preheader.new ], [ %indvars.iv.next93.3, %.lr.ph12 ]
  %98 = phi double [ %.unr164, %.lr.ph12.preheader.new ], [ %120, %.lr.ph12 ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92
  %100 = bitcast double* %99 to <2 x double>*
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %102 = bitcast double* %101 to <2 x double>*
  %103 = load <2 x double>, <2 x double>* %100, align 8
  %104 = load <2 x double>, <2 x double>* %102, align 8
  %105 = fmul <2 x double> %103, %104
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fsub double %98, %106
  %109 = fsub double %108, %107
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %111 = bitcast double* %110 to <2 x double>*
  %112 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %113 = bitcast double* %112 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %114 = load <2 x double>, <2 x double>* %111, align 8
  %115 = load <2 x double>, <2 x double>* %113, align 8
  %116 = fmul <2 x double> %114, %115
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  %119 = fsub double %109, %117
  %120 = fsub double %119, %118
  %exitcond144.3 = icmp eq i64 %indvars.iv.next93.2, %86
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond144.3, label %._crit_edge13.loopexit.unr-lcssa, label %.lr.ph12

._crit_edge13.loopexit.unr-lcssa:                 ; preds = %.lr.ph12
  br label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.prol.loopexit, %._crit_edge13.loopexit.unr-lcssa
  %.lcssa158 = phi double [ %.lcssa158.unr, %.lr.ph12.prol.loopexit ], [ %120, %._crit_edge13.loopexit.unr-lcssa ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %83
  %.lcssa1624 = phi double [ %88, %83 ], [ %.lcssa158, %._crit_edge13.loopexit ]
  %121 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  store double %.lcssa1624, double* %121, align 8
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %122 = icmp slt i64 %indvars.iv.next103, %8
  %indvars.iv.next143 = add i32 %indvars.iv142, 1
  br i1 %122, label %83, label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge13
  %123 = add nsw i64 %9, 1
  br label %124

; <label>:124:                                    ; preds = %._crit_edge, %._crit_edge73
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %._crit_edge73 ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge ], [ %9, %._crit_edge73 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge ], [ %0, %._crit_edge73 ]
  %125 = sub i32 %0, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 %9, %126
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  %129 = load double, double* %128, align 8
  %130 = add nsw i64 %indvars.iv90, 1
  %131 = icmp slt i64 %130, %8
  br i1 %131, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %124
  %132 = sub nsw i64 %123, %126
  %133 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %132, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %134

; <label>:134:                                    ; preds = %134, %.prol.preheader
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next89.prol, %134 ], [ %133, %.prol.preheader ]
  %135 = phi double [ %141, %134 ], [ %129, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %134 ], [ %xtraiter, %.prol.preheader ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88.prol
  %137 = load double, double* %136, align 8
  %138 = getelementptr inbounds double, double* %3, i64 %indvars.iv88.prol
  %139 = load double, double* %138, align 8
  %140 = fmul double %137, %139
  %141 = fsub double %135, %140
  %indvars.iv.next89.prol = add nsw i64 %indvars.iv88.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %134, !llvm.loop !29

.prol.loopexit.unr-lcssa:                         ; preds = %134
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %141, %.prol.loopexit.unr-lcssa ]
  %indvars.iv88.unr = phi i64 [ %133, %.lr.ph ], [ %indvars.iv.next89.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %129, %.lr.ph ], [ %141, %.prol.loopexit.unr-lcssa ]
  %142 = icmp ult i64 %127, 3
  br i1 %142, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %143

; <label>:143:                                    ; preds = %143, %.lr.ph.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr, %.lr.ph.new ], [ %indvars.iv.next89.3, %143 ]
  %144 = phi double [ %.unr, %.lr.ph.new ], [ %166, %143 ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88
  %146 = bitcast double* %145 to <2 x double>*
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv88
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %146, align 8
  %150 = load <2 x double>, <2 x double>* %148, align 8
  %151 = fmul <2 x double> %149, %150
  %152 = extractelement <2 x double> %151, i32 0
  %153 = extractelement <2 x double> %151, i32 1
  %154 = fsub double %144, %152
  %155 = fsub double %154, %153
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv.next89.1
  %157 = bitcast double* %156 to <2 x double>*
  %158 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next89.1
  %159 = bitcast double* %158 to <2 x double>*
  %indvars.iv.next89.2 = add nsw i64 %indvars.iv88, 3
  %160 = load <2 x double>, <2 x double>* %157, align 8
  %161 = load <2 x double>, <2 x double>* %159, align 8
  %162 = fmul <2 x double> %160, %161
  %163 = extractelement <2 x double> %162, i32 0
  %164 = extractelement <2 x double> %162, i32 1
  %165 = fsub double %155, %163
  %166 = fsub double %165, %164
  %exitcond.3 = icmp eq i64 %indvars.iv.next89.2, %9
  %indvars.iv.next89.3 = add nsw i64 %indvars.iv88, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %143

._crit_edge.loopexit.unr-lcssa:                   ; preds = %143
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %166, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %124
  %.lcssa210 = phi double [ %129, %124 ], [ %.lcssa, %._crit_edge.loopexit ]
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv90
  %168 = load double, double* %167, align 8
  %169 = fdiv double %.lcssa210, %168
  %170 = getelementptr inbounds double, double* %3, i64 %indvars.iv90
  store double %169, double* %170, align 8
  %indvars.iv.next91 = add i64 %indvars.iv90, -1
  %171 = icmp sgt i64 %indvars.iv90, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %171, label %124, label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge73.thread, %._crit_edge5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!13, !10}
!17 = distinct !{!17, !4, !5}
!18 = distinct !{!18, !4, !5}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !4, !5}
!25 = distinct !{!25, !2}
!26 = distinct !{!26, !4, !5}
!27 = distinct !{!27, !2}
!28 = distinct !{!28, !2}
!29 = distinct !{!29, !2}
