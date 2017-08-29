; ModuleID = 'A.ll'
source_filename = "lu.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = alloca [2000 x double]*, align 8
  %4 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %3, align 8
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader15.lr.ph, label %._crit_edge66.thread

._crit_edge66.thread:                             ; preds = %2
  %6 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %7 = bitcast [2000 x [2000 x double]]** %4 to i8**
  store i8* %6, i8** %7, align 8
  br label %135

.preheader15.lr.ph:                               ; preds = %2
  %8 = sitofp i32 %0 to double
  %9 = add i32 %0, 7
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count136.7 = zext i32 %0 to i64
  %12 = add nsw i64 %wide.trip.count136.7, -8
  %13 = trunc i32 %9 to i3
  %.pre = load [2000 x double]*, [2000 x double]** %3, align 8
  br label %.lr.ph54

.lr.ph54:                                         ; preds = %._crit_edge61, %.preheader15.lr.ph
  %indvars.iv159 = phi i3 [ %indvars.iv.next160, %._crit_edge61 ], [ %13, %.preheader15.lr.ph ]
  %indvars.iv157 = phi i64 [ %indvars.iv.next158, %._crit_edge61 ], [ 2, %.preheader15.lr.ph ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge61 ], [ 0, %.preheader15.lr.ph ]
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge61 ], [ 1, %.preheader15.lr.ph ]
  %14 = phi [2000 x double]* [ %.pre, %._crit_edge61 ], [ %1, %.preheader15.lr.ph ]
  %15 = zext i3 %indvars.iv159 to i64
  %16 = add nuw nsw i64 %15, 4294967295
  %17 = and i64 %16, 4294967295
  %18 = add i64 %indvars.iv157, %17
  %19 = sub nsw i64 0, %indvars.iv145
  %20 = trunc i64 %19 to i32
  %21 = add i32 %9, %20
  br label %22

; <label>:22:                                     ; preds = %22, %.lr.ph54
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %22 ], [ 0, %.lr.ph54 ]
  %23 = sub nsw i64 0, %indvars.iv126
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %0
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %8
  %28 = fadd double %27, 1.000000e+00
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv145, i64 %indvars.iv126
  store double %28, double* %29, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next127, %indvars.iv143
  br i1 %exitcond131, label %._crit_edge55, label %22

._crit_edge55:                                    ; preds = %22
  %30 = add i32 %10, %20
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %31 = icmp slt i64 %indvars.iv.next146, %11
  br i1 %31, label %.lr.ph60, label %._crit_edge61

.lr.ph60:                                         ; preds = %._crit_edge55
  %xtraiter140 = and i32 %21, 7
  %lcmp.mod141 = icmp eq i32 %xtraiter140, 0
  br i1 %lcmp.mod141, label %.prol.loopexit139, label %.prol.preheader138.preheader

.prol.preheader138.preheader:                     ; preds = %.lr.ph60
  br label %.prol.preheader138

.prol.preheader138:                               ; preds = %.prol.preheader138.preheader, %.prol.preheader138
  %indvars.iv134.prol = phi i64 [ %indvars.iv.next135.prol, %.prol.preheader138 ], [ %indvars.iv143, %.prol.preheader138.preheader ]
  %prol.iter142 = phi i32 [ %prol.iter142.sub, %.prol.preheader138 ], [ %xtraiter140, %.prol.preheader138.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv134.prol
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next135.prol = add nuw nsw i64 %indvars.iv134.prol, 1
  %prol.iter142.sub = add nsw i32 %prol.iter142, -1
  %prol.iter142.cmp = icmp eq i32 %prol.iter142.sub, 0
  br i1 %prol.iter142.cmp, label %.prol.loopexit139.loopexit, label %.prol.preheader138, !llvm.loop !1

.prol.loopexit139.loopexit:                       ; preds = %.prol.preheader138
  br label %.prol.loopexit139

.prol.loopexit139:                                ; preds = %.prol.loopexit139.loopexit, %.lr.ph60
  %indvars.iv134.unr = phi i64 [ %indvars.iv143, %.lr.ph60 ], [ %18, %.prol.loopexit139.loopexit ]
  %33 = icmp ult i32 %30, 7
  br i1 %33, label %._crit_edge61, label %.lr.ph60.new.preheader

.lr.ph60.new.preheader:                           ; preds = %.prol.loopexit139
  %34 = sub i64 %12, %indvars.iv134.unr
  %35 = lshr i64 %34, 3
  %36 = add nuw nsw i64 %35, 1
  %min.iters.check = icmp ult i64 %36, 2
  br i1 %min.iters.check, label %.lr.ph60.new.preheader156, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph60.new.preheader
  %n.mod.vf = and i64 %36, 1
  %n.vec = sub nsw i64 %36, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %37 = add i64 %indvars.iv134.unr, 8
  %38 = shl nuw i64 %35, 3
  %39 = add i64 %37, %38
  %40 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %39, %40
  br i1 %cmp.zero, label %.lr.ph60.new.preheader156, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %41 = shl i64 %index, 3
  %42 = add i64 %indvars.iv134.unr, %41
  %43 = add nsw i64 %42, 7
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %43
  %45 = getelementptr double, double* %44, i64 -7
  %46 = bitcast double* %45 to <16 x double>*
  store <16 x double> zeroinitializer, <16 x double>* %46, align 8
  %index.next = add i64 %index, 2
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge61, label %.lr.ph60.new.preheader156

.lr.ph60.new.preheader156:                        ; preds = %middle.block, %min.iters.checked, %.lr.ph60.new.preheader
  %indvars.iv134.ph = phi i64 [ %indvars.iv134.unr, %min.iters.checked ], [ %indvars.iv134.unr, %.lr.ph60.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph60.new

.lr.ph60.new:                                     ; preds = %.lr.ph60.new.preheader156, %.lr.ph60.new
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.7, %.lr.ph60.new ], [ %indvars.iv134.ph, %.lr.ph60.new.preheader156 ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv134
  store double 0.000000e+00, double* %48, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv.next135
  store double 0.000000e+00, double* %49, align 8
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv.next135.1
  store double 0.000000e+00, double* %50, align 8
  %indvars.iv.next135.2 = add nsw i64 %indvars.iv134, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv.next135.2
  store double 0.000000e+00, double* %51, align 8
  %indvars.iv.next135.3 = add nsw i64 %indvars.iv134, 4
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv.next135.3
  store double 0.000000e+00, double* %52, align 8
  %indvars.iv.next135.4 = add nsw i64 %indvars.iv134, 5
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv.next135.4
  store double 0.000000e+00, double* %53, align 8
  %indvars.iv.next135.5 = add nsw i64 %indvars.iv134, 6
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv.next135.5
  store double 0.000000e+00, double* %54, align 8
  %indvars.iv.next135.6 = add nsw i64 %indvars.iv134, 7
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv.next135.6
  store double 0.000000e+00, double* %55, align 8
  %indvars.iv.next135.7 = add nsw i64 %indvars.iv134, 8
  %exitcond137.7 = icmp eq i64 %indvars.iv.next135.7, %wide.trip.count136.7
  br i1 %exitcond137.7, label %._crit_edge61.loopexit, label %.lr.ph60.new, !llvm.loop !6

._crit_edge61.loopexit:                           ; preds = %.lr.ph60.new
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %middle.block, %.prol.loopexit139, %._crit_edge55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv145, i64 %indvars.iv145
  store double 1.000000e+00, double* %56, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, %wide.trip.count136.7
  %indvars.iv.next158 = add nuw i64 %indvars.iv157, 1
  %indvars.iv.next160 = add i3 %indvars.iv159, -1
  br i1 %exitcond148, label %.preheader14.us.preheader, label %.lr.ph54

.preheader14.us.preheader:                        ; preds = %._crit_edge61
  %57 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %58 = bitcast [2000 x [2000 x double]]** %4 to i8**
  store i8* %57, i8** %58, align 8
  %59 = add i32 %0, -1
  %60 = zext i32 %59 to i64
  %61 = shl nuw nsw i64 %60, 3
  %62 = add nuw nsw i64 %61, 8
  %xtraiter122 = and i32 %0, 3
  %lcmp.mod123 = icmp eq i32 %xtraiter122, 0
  br i1 %lcmp.mod123, label %.preheader14.us.prol.loopexit, label %._crit_edge47.us.prol.preheader

._crit_edge47.us.prol.preheader:                  ; preds = %.preheader14.us.preheader
  %63 = add nsw i32 %xtraiter122, -1
  %64 = zext i32 %63 to i64
  %65 = bitcast i8* %57 to [2000 x [2000 x double]]*
  br label %._crit_edge47.us.prol

._crit_edge47.us.prol:                            ; preds = %._crit_edge47.us.prol.preheader, %._crit_edge47.us.prol
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %._crit_edge47.us.prol ], [ 0, %._crit_edge47.us.prol.preheader ]
  %prol.iter124 = phi i32 [ %prol.iter124.sub, %._crit_edge47.us.prol ], [ %xtraiter122, %._crit_edge47.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv118.prol, i64 0
  %scevgep117.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.prol, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.prol = add nuw nsw i64 %indvars.iv118.prol, 1
  %prol.iter124.sub = add nsw i32 %prol.iter124, -1
  %prol.iter124.cmp = icmp eq i32 %prol.iter124.sub, 0
  br i1 %prol.iter124.cmp, label %.preheader14.us.prol.loopexit.loopexit, label %._crit_edge47.us.prol, !llvm.loop !8

.preheader14.us.prol.loopexit.loopexit:           ; preds = %._crit_edge47.us.prol
  %66 = add nuw nsw i64 %64, 1
  br label %.preheader14.us.prol.loopexit

.preheader14.us.prol.loopexit:                    ; preds = %.preheader14.us.prol.loopexit.loopexit, %.preheader14.us.preheader
  %indvars.iv118.unr = phi i64 [ 0, %.preheader14.us.preheader ], [ %66, %.preheader14.us.prol.loopexit.loopexit ]
  %67 = icmp ult i32 %59, 3
  br i1 %67, label %.preheader12.us.preheader, label %._crit_edge47.us.3.preheader

._crit_edge47.us.3.preheader:                     ; preds = %.preheader14.us.prol.loopexit
  %68 = add nsw i64 %wide.trip.count136.7, -4
  %69 = sub nsw i64 %68, %indvars.iv118.unr
  %70 = lshr i64 %69, 2
  %71 = and i64 %70, 1
  %lcmp.mod = icmp eq i64 %71, 0
  br i1 %lcmp.mod, label %._crit_edge47.us.3.prol.preheader, label %._crit_edge47.us.3.prol.loopexit

._crit_edge47.us.3.prol.preheader:                ; preds = %._crit_edge47.us.3.preheader
  br label %._crit_edge47.us.3.prol

._crit_edge47.us.3.prol:                          ; preds = %._crit_edge47.us.3.prol.preheader
  %72 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %scevgep.prol162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv118.unr, i64 0
  %scevgep117.prol163 = bitcast double* %scevgep.prol162 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.prol163, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.prol164 = add nuw nsw i64 %indvars.iv118.unr, 1
  %scevgep.1.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv.next119.prol164, i64 0
  %scevgep117.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1.prol, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.1.prol = add nsw i64 %indvars.iv118.unr, 2
  %scevgep.2.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv.next119.1.prol, i64 0
  %scevgep117.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2.prol, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.2.prol = add nsw i64 %indvars.iv118.unr, 3
  %scevgep.3.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv.next119.2.prol, i64 0
  %scevgep117.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3.prol, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.3.prol = add nsw i64 %indvars.iv118.unr, 4
  br label %._crit_edge47.us.3.prol.loopexit

._crit_edge47.us.3.prol.loopexit:                 ; preds = %._crit_edge47.us.3.prol, %._crit_edge47.us.3.preheader
  %indvars.iv118.unr165 = phi i64 [ %indvars.iv118.unr, %._crit_edge47.us.3.preheader ], [ %indvars.iv.next119.3.prol, %._crit_edge47.us.3.prol ]
  %73 = icmp eq i64 %70, 0
  br i1 %73, label %.preheader12.us.preheader.loopexit, label %._crit_edge47.us.3.preheader.new

._crit_edge47.us.3.preheader.new:                 ; preds = %._crit_edge47.us.3.prol.loopexit
  %74 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %75 = bitcast i8* %57 to [2000 x [2000 x double]]*
  br label %._crit_edge47.us.3

.preheader12.us.preheader.loopexit.unr-lcssa:     ; preds = %._crit_edge47.us.3
  br label %.preheader12.us.preheader.loopexit

.preheader12.us.preheader.loopexit:               ; preds = %._crit_edge47.us.3.prol.loopexit, %.preheader12.us.preheader.loopexit.unr-lcssa
  br label %.preheader12.us.preheader

.preheader12.us.preheader:                        ; preds = %.preheader12.us.preheader.loopexit, %.preheader14.us.prol.loopexit
  %xtraiter102 = and i32 %0, 1
  %76 = icmp eq i32 %xtraiter102, 0
  %77 = icmp eq i32 %0, 1
  %78 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %79 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %.pre to i64
  br label %.preheader11.us.us.preheader

.preheader11.us.us.preheader:                     ; preds = %._crit_edge27.us, %.preheader12.us.preheader
  %indvars.iv108 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next109, %._crit_edge27.us ]
  %sunkaddr151 = shl i64 %indvars.iv108, 3
  %sunkaddr152 = add i64 %sunkaddr, %sunkaddr151
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to double*
  br label %.preheader11.us.us

._crit_edge27.us:                                 ; preds = %._crit_edge25.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count136.7
  br i1 %exitcond111, label %.preheader.us.preheader, label %.preheader11.us.us.preheader

.preheader11.us.us:                               ; preds = %._crit_edge25.us.us, %.preheader11.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader11.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge25.us.us ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 %76, label %.prol.loopexit101, label %81

; <label>:81:                                     ; preds = %.preheader11.us.us
  %82 = load double, double* %80, align 8
  %83 = load double, double* %sunkaddr153, align 8
  %84 = fmul double %82, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv104, i64 0
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  store double %87, double* %85, align 8
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.preheader11.us.us, %81
  %indvars.iv96.unr.ph = phi i64 [ 1, %81 ], [ 0, %.preheader11.us.us ]
  br i1 %77, label %._crit_edge25.us.us, label %.preheader11.us.us.new.preheader

.preheader11.us.us.new.preheader:                 ; preds = %.prol.loopexit101
  br label %.preheader11.us.us.new

._crit_edge25.us.us.loopexit:                     ; preds = %.preheader11.us.us.new
  br label %._crit_edge25.us.us

._crit_edge25.us.us:                              ; preds = %._crit_edge25.us.us.loopexit, %.prol.loopexit101
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, %wide.trip.count136.7
  br i1 %exitcond107, label %._crit_edge27.us, label %.preheader11.us.us

.preheader11.us.us.new:                           ; preds = %.preheader11.us.us.new.preheader, %.preheader11.us.us.new
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.preheader11.us.us.new ], [ %indvars.iv96.unr.ph, %.preheader11.us.us.new.preheader ]
  %88 = load double, double* %80, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv96, i64 %indvars.iv108
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  store double %94, double* %92, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %95 = load double, double* %80, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv.next97, i64 %indvars.iv108
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %100 = load double, double* %99, align 8
  %101 = fadd double %98, %100
  store double %101, double* %99, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, %wide.trip.count136.7
  br i1 %exitcond99.1, label %._crit_edge25.us.us.loopexit, label %.preheader11.us.us.new

.preheader.us.preheader:                          ; preds = %._crit_edge27.us
  %102 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %4, align 8
  %103 = load [2000 x double]*, [2000 x double]** %3, align 8
  %104 = add nsw i32 %xtraiter122, -1
  %105 = zext i32 %104 to i64
  %106 = add nuw nsw i64 %105, 1
  %107 = icmp eq i32 %xtraiter122, 0
  %108 = icmp ult i32 %59, 3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv91 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next92, %._crit_edge.us ]
  br i1 %107, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter122, %.prol.preheader.preheader ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv91, i64 %indvars.iv.prol
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %103, i64 %indvars.iv91, i64 %indvars.iv.prol
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !9

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %106, %.prol.loopexit.loopexit ]
  br i1 %108, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %103, i64 %indvars.iv91, i64 %indvars.iv
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %103, i64 %indvars.iv91, i64 %indvars.iv.next
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %103, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %103, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count136.7
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond = icmp eq i64 %indvars.iv.next92, %wide.trip.count136.7
  br i1 %exitcond, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us
  %134 = bitcast [2000 x [2000 x double]]* %102 to i8*
  br label %135

; <label>:135:                                    ; preds = %._crit_edge66.thread, %._crit_edge19
  %136 = phi i8* [ %134, %._crit_edge19 ], [ %6, %._crit_edge66.thread ]
  tail call void @free(i8* %136) #3
  ret void

._crit_edge47.us.3:                               ; preds = %._crit_edge47.us.3, %._crit_edge47.us.3.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr165, %._crit_edge47.us.3.preheader.new ], [ %indvars.iv.next119.3.1, %._crit_edge47.us.3 ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv118, i64 0
  %scevgep117 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv.next119, i64 0
  %scevgep117.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv.next119.1, i64 0
  %scevgep117.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.2 = add nsw i64 %indvars.iv118, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv.next119.2, i64 0
  %scevgep117.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.3 = add nsw i64 %indvars.iv118, 4
  %scevgep.1166 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv.next119.3, i64 0
  %scevgep117.1167 = bitcast double* %scevgep.1166 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1167, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.1168 = add nsw i64 %indvars.iv118, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv.next119.1168, i64 0
  %scevgep117.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1.1, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.1.1 = add nsw i64 %indvars.iv118, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv.next119.1.1, i64 0
  %scevgep117.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2.1, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.2.1 = add nsw i64 %indvars.iv118, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv.next119.2.1, i64 0
  %scevgep117.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3.1, i8 0, i64 %62, i32 8, i1 false)
  %indvars.iv.next119.3.1 = add nsw i64 %indvars.iv118, 8
  %exitcond121.3.1 = icmp eq i64 %indvars.iv.next119.3.1, %wide.trip.count136.7
  br i1 %exitcond121.3.1, label %.preheader12.us.preheader.loopexit.unr-lcssa, label %._crit_edge47.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.preheader, label %._crit_edge21

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count76 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %._crit_edge16
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge16 ], [ 0, %.preheader6.preheader ]
  %4 = add nuw i64 %indvars.iv74, 4294967295
  %5 = icmp sgt i64 %indvars.iv74, 0
  br i1 %5, label %.preheader5.preheader, label %._crit_edge16

.preheader5.preheader:                            ; preds = %.preheader6
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 0
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %._crit_edge
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %7 = add nuw i64 %indvars.iv46, 4294967295
  %8 = icmp sgt i64 %indvars.iv46, 0
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv46
  %.pre = load double, double* %9, align 8
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter79 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %10

; <label>:10:                                     ; preds = %.lr.ph
  %11 = load double, double* %6, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv46
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %10
  %indvars.iv.unr.ph = phi i64 [ 1, %10 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %15, %10 ], [ %.pre, %.lr.ph ]
  %.lcssa37.unr.ph = phi double [ %15, %10 ], [ undef, %.lr.ph ]
  %16 = trunc i64 %7 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %18 = phi double [ %30, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv46
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv46
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %9, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader5, %.prol.loopexit
  %31 = phi double [ %.lcssa37.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader5 ], [ %30, %._crit_edge.loopexit ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv46
  %33 = load double, double* %32, align 8
  %34 = fdiv double %31, %33
  store double %34, double* %9, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv74
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader5

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter6178 = and i64 %indvars.iv74, 1
  %35 = trunc i64 %4 to i32
  %36 = icmp eq i64 %xtraiter6178, 0
  %37 = icmp eq i32 %35, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge13.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge13.us ], [ %indvars.iv74, %.preheader.us.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv66
  %.pre33 = load double, double* %38, align 8
  br i1 %36, label %.prol.loopexit60, label %39

; <label>:39:                                     ; preds = %.preheader.us
  %40 = load double, double* %6, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv66
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %.pre33, %43
  store double %44, double* %38, align 8
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.preheader.us, %39
  %indvars.iv52.unr.ph = phi i64 [ 1, %39 ], [ 0, %.preheader.us ]
  %.unr63.ph = phi double [ %44, %39 ], [ %.pre33, %.preheader.us ]
  br i1 %37, label %._crit_edge13.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit60
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.preheader.us.new ], [ %indvars.iv52.unr.ph, %.preheader.us.new.preheader ]
  %45 = phi double [ %57, %.preheader.us.new ], [ %.unr63.ph, %.preheader.us.new.preheader ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv52
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv66
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %45, %50
  store double %51, double* %38, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next53
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv66
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fsub double %51, %56
  store double %57, double* %38, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next53.1, %indvars.iv74
  br i1 %exitcond58.1, label %._crit_edge13.us.loopexit, label %.preheader.us.new

._crit_edge13.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit60
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next67, %wide.trip.count76
  br i1 %exitcond71, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader6
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %.preheader6

._crit_edge21.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %9 = mul nsw i64 %8, %indvars.iv8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count
  br i1 %exitcond11, label %._crit_edge3.loopexit, label %.preheader.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
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
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !2}
